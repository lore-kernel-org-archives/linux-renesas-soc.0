Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v2 03/11] serial: sh-sci: Always set TIOCM_CTS in
 .get_mctrl() callback
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1461934714-18681-1-git-send-email-geert+renesas@glider.be>
 <1461934714-18681-4-git-send-email-geert+renesas@glider.be>
Cc: Jiri Slaby <jslaby@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
From: Peter Hurley <peter@hurleysoftware.com>
Message-ID: <57237FE1.8030200@hurleysoftware.com>
Date: Fri, 29 Apr 2016 08:38:09 -0700
MIME-Version: 1.0
In-Reply-To: <1461934714-18681-4-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/29/2016 05:58 AM, Geert Uytterhoeven wrote:
> Documentation/serial/driver clearly states:
> 
>     If the port does not support CTS, DCD or DSR, the driver should
>     indicate that the signal is permanently active.
> 
> Hence always set TIOCM_CTS, as we currently don't look at the CTS
> hardware line state at all.
> 
> FWIW, this fixes the transmit path when hardware-assisted flow control
> is enabled, and userspace enables CRTSCTS.
> The receive path is still broken, as RTS is never asserted.

Reviewed-by: Peter Hurley <peter@hurleysoftware.com>
