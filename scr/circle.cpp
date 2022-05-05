#include "ros/ros.h"

#include "geometry_msgs/Twist.h"



int main(int argc, char** argv)

{

    ros::init(argc, argv, "circle_turtle");

    ros::NodeHandle n;

    ros::Publisher pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);

    geometry_msgs::Twist twist;

    twist.linear.x = 2.0;

    twist.angular.z = 1.0;  

    ros::Rate r(10);

    while(ros::ok())

    {

        pub.publish(twist);

        r.sleep();

    }

    return 0;

}


