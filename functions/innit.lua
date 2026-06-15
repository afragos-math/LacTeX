local M = {}

    function M.thms(class)
        
        local numbering = ''
        
        if class == 'book' then
            numbering = 'chapter'
        else
            numbering = 'section'
        end
    
        return [[
            
        \newtheorem{theorem}{Theorem}[]] .. numbering .. [[]
        
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
        
        \newtheorem{exercise}{Exercise}[]] .. numbering .. [[]
        
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
        
        ]]
    end
    
    function M.thmsgr(class)
    
        local numbering = ''
    
        if class == 'book' then
            numbering = 'chapter'
        else
            numbering = 'section'
        end
            
        return [[
                
        \newtheorem{theorem}{Θεώρημα}[]] .. numbering .. [[]
                
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
        
        \newtheorem{proposition}[theorem]{Πρόταση}
        
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
        
        \newtheorem{definition}[theorem]{Ορισμός}
        
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
        
        \newtheorem{lemma}[theorem]{Λήμμα}
        
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
        
        \newtheorem{corollary}[theorem]{Πόρισμα}
        
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
        
        \newtheorem{remark}[theorem]{Παρατήρηση}
        
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
        
        \newtheorem{conjecture}[theorem]{Εικασία}
        
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
        
        \newtheorem{exercise}{Άσκηση}[]] .. numbering .. [[]
        
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
        
        ]]
    end

return M
