Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: mattw@codeaurora.org, mitchelh@codeaurora.org, broonie@kernel.org,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, chris.paterson2@renesas.com,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 0/2] Avoid namespace collision within macros
Date: Thu, 27 Oct 2016 10:33:17 +0100
Message-Id: <1477560799-58896-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi All,

   The readx_poll_timeout & similar macros defines "ktime timeout" local
   variable. Fixed this potential namespace collision issue.

   This patchset is based on top of latest linux repo

   commit 9fe68cad6e74967b88d0c6aeca7d9cd6b6e91942

Thanks,
Ramesh

Ramesh Shanmugasundaram (2):
  iopoll: Avoid namespace collision within macros
  regmap: Avoid namespace collision within macro

 include/linux/iopoll.h | 8 ++++----
 include/linux/regmap.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.9.1
