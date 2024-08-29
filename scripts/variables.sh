#create variables for project locaiton and github repo
export project_dir=/home/nikhil/nighthawk  # change nighthawk to different name to test your git clone
export project=$project_dir/Nikhil_2025  # change portfolio_2025 to name of project from git clone
export project_repo="https://github.com/SlothInTheHat/Nikhil_2025.git"  # change to project you created from portfolio_2025 template 


#print out these variables in the console
echo "Project dir: $project_dir"
echo "Project: $project"
echo "Repo: $project_repo"
echo ""


#print ruby version
echo "RUBY VERSION:"
ruby -v
echo ""

#print bundle version
echo "BUNDLE VERSION:"
bundle -v
echo ""

#print pyhton version
echo "PYTHON VERSION:"
python --version
echo ""

#print ruby packages
echo "JUPYTER PACKEGES:"
jupyter --version
echo ""

echo "NOW SETTING UP VIRTUAL ENVIORMENT"

#run virtual enciorment script
./venv.sh

#activate virtual enviorment script
source venv/bin/activate
echo ""

echo "YAY VIRTUAL ENVIORMENT SET UP"