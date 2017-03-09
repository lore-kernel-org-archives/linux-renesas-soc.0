Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] [RFC] base: soc: soc_device_match() improvements
Date: Thu,  9 Mar 2017 19:18:31 +0100
Message-Id: <1489083513-19245-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Arnd, Greg,

This patch series contains two RFC improvements for the SoC bus and
soc_device_match().  Both are the result of investigations for handling
different SoC revisions in the Renesas R-Car SYSC driver, which manages
PM Domains and thus needs to be initialized from an early_initcall.

Thanks for your comments!

Geert Uytterhoeven (2):
  [RFC] base: soc: Let soc_device_match() return no match when called
    too early
  [RFC] base: soc: Allow early registration of a single SoC device

 drivers/base/soc.c | 52 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 18 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
