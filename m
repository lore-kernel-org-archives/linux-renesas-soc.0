Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52083 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752258AbcJEJwY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 05:52:24 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: Kernel configuration R-Car ALT(E2)
Date: Wed, 05 Oct 2016 12:52:19 +0300
Message-ID: <9286161.YcvARVbxY0@avalon>
In-Reply-To: <SG2PR0401MB12961C5C8C7E01027ED8E278D8C50@SG2PR0401MB1296.apcprd04.prod.outlook.com>
References: <SG2PR0401MB12961C5C8C7E01027ED8E278D8C50@SG2PR0401MB1296.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Jithin,

On Tuesday 04 Oct 2016 10:24:06 Jithin T Raj wrote:
>    Thank you..shmobile_defconfig solvs my problem..now Ibuild kernel and
> deployed through nfs tftp into ALT Board..The board is accepting kernel but
> after some time I am getting some errors..I have attached the error log
> here
> 
> I have the rootfs of ALT Board in /exports folder..

Quickly looking at the log I don't see anything that's really kernel-specific 
there. I think you have reached a point where you need to start debugging by 
yourself, we can't do all the work for you.

-- 
Regards,

Laurent Pinchart
