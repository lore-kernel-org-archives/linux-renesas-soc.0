Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539F9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 13:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25758214DA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 13:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729710AbfBRNMZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 08:12:25 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39741 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729283AbfBRNMZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:12:25 -0500
Received: by mail-qt1-f194.google.com with SMTP id o6so19044929qtk.6;
        Mon, 18 Feb 2019 05:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pVDvp/pZYMpPQNOq3faGwENXNKHYA5c0q53ip6dMAeU=;
        b=Kck/vb06IScaYiE3zq47zS8GxmFHx+IPo2/3PZDh0AnwerB0iQm853RHf0QPHQD53e
         pEtyQOr5FXMLVxeOqQg4TOHaP0/PQzBb2cszBulfSg3T4GNjzccvGDT2oJT4bFjYUD1s
         Pe2jE4/w+bb+xzWaoaRL3avcL1tDEfnQwgiQPXljr7yed7+gIcit3BPrxAmxk2roWxdO
         V1XqqXzVYAoLLrwznyCfYp/j8Fy3KMTFYRTG6YLp0+xImsuLzxdnpPxXNcun0AMz7TYx
         XiTtGz5Bxx4Xf+UhZ6Y2RnComdDWwUs5ZY740YspV69GpN4h9ovt7N5+XXm52xjZdu/y
         e/+A==
X-Gm-Message-State: AHQUAub3ftZClvfLFbz7UpvmDptQOQpje7rWqHv/PmwXZYilPx0f6GAo
        gGemSR3xJ+Wc5mPUlW2pCb96ks11yQ8+OYlToDw=
X-Google-Smtp-Source: AHgI3IY/ZlfYifC+QcHm3Ii/+I7UJohCqL235t4hAdfqNDFfh7SaaxV4XWwtM/61ps9zyxS4MDO1VFQCFMpqGjp4XHw=
X-Received: by 2002:a0c:98c8:: with SMTP id g8mr17565857qvd.161.1550495544653;
 Mon, 18 Feb 2019 05:12:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549622472.git.horms+renesas@verge.net.au>
 <CAK8P3a0prd-4eyVOVUpp2Bhn1mGOVZwA_we79TNjSa4FF5DP6A@mail.gmail.com> <20190218112715.zufzr3knrhs37t6h@verge.net.au>
In-Reply-To: <20190218112715.zufzr3knrhs37t6h@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 18 Feb 2019 14:12:07 +0100
Message-ID: <CAK8P3a1BrahyfrRD=1dSLNzc1mujh+rxdLoU8CtGruRSbo3JVg@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.1
To:     Simon Horman <horms@verge.net.au>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 18, 2019 at 12:27 PM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Feb 15, 2019 at 05:49:32PM +0100, Arnd Bergmann wrote:
> > On Fri, Feb 8, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > Renesas ARM Based SoC Updates for v5.1
> > >
> > > * Correct shared IRQ handling of R-Car Gen2 Regulator quirk
> > > * Add missing dts files to MAINTAINERS
> >
> > Should the bugfix be marked Cc:stable and and Fixes:... ?
> >
> Sorry for missing that, I think that the bugfix should have had the following.
> Let me know if/how you want to handle updating the patch's changelog.
>
> Fixes: 6d14d4d313d09dab ("ARM: shmobile: Rework the PMIC IRQ line quirk")

I think the easiest way is to send an email to stable@kernel.org asking for
a backport of commit 5347a0203709 ("ARM: shmobile: Fix R-Car Gen2 regulator
quirk") after that has hit the mainline kernel and asking for a backport.

I've added it to Cc here, but I don't know if that's sufficient.

If you'd rather have me pick up the patch for 5.0 as well, I can also do
that and add the Cc/Fixes lines there. We will then have a duplicate
commit in 5.1, but it should not cause any merge issues.

      Arnd
