#include <iostream>
#include <string>

int main() {
  // Flush after every std::cout / std:cerr
  std::cout << std::unitbuf;
  std::cerr << std::unitbuf;

  // TODO: Uncomment the code below to pass the first stage
  while(true){
    std::cout<<"$ ";
    std::string command;
    std::getline(std::cin,command);
    if(command=="exit"){
      break;
    }
    else if(command.substr(0,5)=="echo "){
      std::cout<<command.substr(5,command.size()-1)<<std::endl;
    }

    else if(command.substr(0,5)=="type "){
        if(command.substr(5,command.size()-1)=="exit" || command.substr(5,command.size()-1)=="type" || command.substr(5,command.size()-1)=="echo"){
          std::cout<<command.substr(5,command.size()-1)<<" is a shell builtin"<<std::endl;
        }else{
          std::cout<<command.substr(5,command.size()-1)<<": command not found\n";
          break;
        }
    }
    else{
      std::cout<<command<<": command not found\n";
    }
  }

  return 0;
}
