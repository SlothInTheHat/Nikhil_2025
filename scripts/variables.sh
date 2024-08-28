export project_dir=/home/nikhil/nighthawk  # change nighthawk to different name to test your git clone
export project=$project_dir/Nikhil_2025  # change portfolio_2025 to name of project from git clone
export project_repo="https://github.com/SlothInTheHat/Nikhil_2025.git"  # change to project you created from portfolio_2025 template 

echo "Project dir: $project_dir"
echo "Project: $project"
echo "Repo: $project_repo"
echo ""

echo "RUBY VERSION:"
ruby -v
echo ""

echo "BUNDLE VERSION:"
bundle -v
echo ""

echo "PYTHON VERSION:"
python --version
echo ""

echo "JUPYTER PACKEGES:"
jupyter --version
echo ""

echo "NOW SETTING UP VIRTUAL ENVIORMENT"

./venv.sh

source venv/bin/activate
echo ""

echo "YAY VIRTUAL ENVIORMENT SET UP"