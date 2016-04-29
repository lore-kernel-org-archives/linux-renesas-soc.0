Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v2 07/11] serial: sh-sci: Add more Serial Port
 Control/Data Register documentation
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1461934714-18681-1-git-send-email-geert+renesas@glider.be>
 <1461934714-18681-8-git-send-email-geert+renesas@glider.be>
Cc: Jiri Slaby <jslaby@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
From: Peter Hurley <peter@hurleysoftware.com>
Message-ID: <572380D7.5040709@hurleysoftware.com>
Date: Fri, 29 Apr 2016 08:42:15 -0700
MIME-Version: 1.0
In-Reply-To: <1461934714-18681-8-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/29/2016 05:58 AM, Geert Uytterhoeven wrote:
> Improve documentation for the SCIFA/SCIFB Serial Port Control and Data
> Registers:
>   - State clearly that the RTS and CTS lines are active-low,
>   - Document the bits related to the serial port's SCK, RXD, and TXD
>     pins.

Reviewed-by: Peter Hurley <peter@hurleysoftware.com>
