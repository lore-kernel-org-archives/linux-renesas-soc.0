Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:34254 "EHLO
	mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753522AbcD2Pjs (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 29 Apr 2016 11:39:48 -0400
Received: by mail-pf0-f175.google.com with SMTP id y69so49471500pfb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2016 08:39:48 -0700 (PDT)
Subject: Re: [PATCH v2 05/11] serial: sh-sci: Do not open-code sci_getreg()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1461934714-18681-1-git-send-email-geert+renesas@glider.be>
 <1461934714-18681-6-git-send-email-geert+renesas@glider.be>
Cc: Jiri Slaby <jslaby@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
From: Peter Hurley <peter@hurleysoftware.com>
Message-ID: <5723803A.8090508@hurleysoftware.com>
Date: Fri, 29 Apr 2016 08:39:38 -0700
MIME-Version: 1.0
In-Reply-To: <1461934714-18681-6-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/29/2016 05:58 AM, Geert Uytterhoeven wrote:
> Replace open-coded variants of sci_getreg() by function calls, and drop
> intermediate variables where appropriate.

Reviewed-by: Peter Hurley <peter@hurleysoftware.com>
