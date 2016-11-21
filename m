Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37174 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752389AbcKUJSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 04:18:45 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <simon@horms.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 07/13] arm64: dts: r8a7795: Add PWM support
Date: Mon, 21 Nov 2016 11:18:59 +0200
Message-ID: <7240025.pvPQj9XMyK@avalon>
In-Reply-To: <CAMuHMdXLQyBX3i73Swr-3W8s-a_5J7rObimDh1DA1tfYSTMNYw@mail.gmail.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-8-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXLQyBX3i73Swr-3W8s-a_5J7rObimDh1DA1tfYSTMNYw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Monday 21 Nov 2016 09:27:38 Geert Uytterhoeven wrote:
> On Sat, Nov 19, 2016 at 4:28 AM, Laurent Pinchart wrote:
> > Add the 7 PWM channels to the r8a7795 device tree, in the disabled
> > state.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This patch is independent from the rest of the series, could you please pick 
it up ?

-- 
Regards,

Laurent Pinchart
