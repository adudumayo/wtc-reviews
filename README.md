# wtc-reviews

Instead of suffering, I let Bash and Python suffer for me. **wtc-reviews** automates the repetitive task of accepting, commenting, and completing code reviews in my school’s terminal-based LMS. It makes the whole process more efficienct and less frustrating...It might also get you in some trouble too, trust me on this one. 

## 🚀 What It Does  

- Runs the LMS review command repeatedly until a review is available.  
- Extracts the **UUID** of the next reviewable submission.  
- Accepts the review (if possible).  
- Leaves a *thoughtful* comment: `"Nice"`.  
- Completes the review and moves on to the next one.  
- Repeats until no more reviews are left.  

Basically, it turns a tedious manual process into an automated dream… or a **review farm**, depending on who’s asking.  

## 🛠️ Tech Stack  

- **Bash** – Because scripting is life.  
- **Python** – For smarter text parsing.  
- **wtc-lms CLI** – The tool I had to outsmart.  

## 🔧 Installation & Usage  

### Linux & macOS  

```sh
git clone https://github.com/adudumayo/wtc-reviews.git  
cd wtc-reviews  
chmod +x reviewCommand.sh  
./reviewCommand.sh  
```

### Windows  

- Just WSL, if doesn't work then sorry!.  

## 📝 How It Works  

1. **`reviewCommand.sh`** keeps running `wtc-lms reviews` until it finds an available review.  
2. **`uuidFinder.py`** extracts the **UUID** of the next reviewable submission.  
3. **`acceptor.py`** checks if the review was successfully accepted.  
4. The script **adds a comment** (you can customize this to maybe `"lgmt"`, but `"Nice"` is a classic).  
5. It **completes the review** and starts over until all reviews are done.  

## ⚠️ Disclaimer  

- This was built for *fun* and *efficiency* (Although I had to answer a few questions about it).  
- If you're an LMS admin reading this... **I blame Perfomance Team** 👀

## 📌 Contribution  

If you have ideas for better comments than `"Nice"`, feel free to fork and PR.  

## 📄 License  

MIT – Use it wisely.  
