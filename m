Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:34585 "EHLO
	mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753391AbcD2PlO (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 29 Apr 2016 11:41:14 -0400
Received: by mail-pf0-f182.google.com with SMTP id y69so49486488pfb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2016 08:41:14 -0700 (PDT)
Subject: Re: [PATCH v2 06/11] serial: sh-sci: Add more Serial Port Register
 documentation
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1461934714-18681-1-git-send-email-geert+renesas@glider.be>
 <1461934714-18681-7-git-send-email-geert+renesas@glider.be>
Cc: Jiri Slaby <jslaby@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
From: Peter Hurley <peter@hurleysoftware.com>
Message-ID: <57238096.6000802@hurleysoftware.com>
Date: Fri, 29 Apr 2016 08:41:10 -0700
MIME-Version: 1.0
In-Reply-To: <1461934714-18681-7-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/29/2016 05:58 AM, Geert Uytterhoeven wrote:
> Improve documentation for the (H)SCIF Serial Port Register:
>   - Make it clear the RTS and CTS lines are active-low,
>   - Document the bits related to the serial port's clock pin.

Reviewed-by: Peter Hurley <peter@hurleysoftware.com>
