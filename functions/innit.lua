local M = {}

    function M.thms()
        return [[
            
        \newtheorem{theorem}{Theorem}[chapter]
        
        \newtheoremstyle{theorem}
        {0pt}
        {0pt}
        {}
        {}
        {\bf}
        {\;}
        {0.25em}
        {\thmnumber{{#1}{}~{#2}}
        \thmnote{~(#3).}}
        
        \newtheorem{proposition}[theorem]{Proposition}
        
        \newtheoremstyle{proposition}
        {0pt}
        {0pt}
        {\normalfont}
        {}
        {\bf}
        {\;}
        {0.25em}
        {\thmnumber{{#1}{}~{#2}}
        \thmnote{~(#3).}}
        
        \newtheorem{definition}[theorem]{Definition}
        
        \newtheoremstyle{definition}
        {0pt}
        {0pt}
        {\normalfont}
        {}
        {\bf}
        {\;}
        {0.25em}
        {\thmnumber{{#1}{}~{#2}}
        \thmnote{~(#3).}}
        
        \newtheorem{lemma}[theorem]{Lemma}
            
        \newtheoremstyle{lemma}
        {0pt}
        {0pt}
        {}
        {}
        {\bf}
        {\;}
        {0.25em}
        {\thmnumber{{#1}{}~{#2}}
        \thmnote{~(#3).}}
        
        \newtheorem{corollary}[theorem]{Corollary}
        
        \newtheoremstyle{corollary}
        {0pt}
        {0pt}
        {}
        {}
        {\bf}
        {\;}
        {0.25em}
        {\thmnumber{{#1}{}~{#2}}
        \thmnote{~(#3).}}
        
        \newtheorem{remark}[theorem]{Remark}
        
        \newtheoremstyle{remark}
        {0pt}
        {0pt}
        {}
        {}
        {\bf}
        {\;}
        {0.25em}
        {\thmnumber{{#1}{}~{#2}}
        \thmnote{~(#3).}}
        
        \newtheorem{exercise}{Exercise}[chapter]
        
        \newtheoremstyle{exercise}
        {0pt}
        {0pt}
        {}
        {}
        {\bf}
        {\;}
        {0.25em}
        {\thmnumber{{#1}{}~{#2}}
        \thmnote{~(#3).}}
        
        \newtheorem{conjecture}[theorem]{Conjecture}
        
        \newtheoremstyle{conjecture}
        {0pt}
        {0pt}
        {}
        {}
        {\bf}
        {\;}
        {0.25em}
        {\thmnumber{{#1}{}~{#2}}
        \thmnote{~(#3).}}
        
        ]]
    end

return M
