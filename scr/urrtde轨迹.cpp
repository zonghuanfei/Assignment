#include <ur_rtde/rtde_control_interface.h>
#include <thread>
#include <chrono>
//令关节q从{-1, -1, -1, 0, 0, 0}变化为{0, 0, 0, 0, 0, 0}
using namespace ur_rtde;
using namespace std::chrono;

int main(int argc, char* argv[])
{
  RTDEControlInterface rtde_control("127.0.0.1");
  double velocity = 1;
  double acceleration = 0.5;
  double dt = 1.0/1000; // 每个循环为0.01s
  double lookahead_time = 0.1;
  double gain = 500; //参数最优值应当为一个控制周期
  std::vector<double> joint_q = {-1, -1, -1, 0, 0, 0};


  rtde_control.moveJ(joint_q);


  for (unsigned int i=0; i<1000; i++)//总循环时间为1000X0.01=1s
  {
    auto t_start = high_resolution_clock::now();
    rtde_control.servoJ(joint_q, velocity, acceleration, dt, lookahead_time, gain);
    joint_q[0] += 0.001;
    joint_q[1] += 0.001;//位姿变化
    auto t_stop = high_resolution_clock::now();
    auto t_duration = std::chrono::duration<double>(t_stop - t_start);

    if (t_duration.count() < dt)
    {
      std::this_thread::sleep_for(std::chrono::duration<double>(dt - t_duration.count()));//休眠保证一个循环花费的时间等于一个周期
    }
  }

  rtde_control.servoStop();
  rtde_control.stopScript();

  return 0;
}
