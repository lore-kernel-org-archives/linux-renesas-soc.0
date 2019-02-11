Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F63C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 12:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D53C218D8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 12:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbfBKMS2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 07:18:28 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:36470 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfBKMS2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 07:18:28 -0500
Received: by mail-vs1-f66.google.com with SMTP id t13so6099134vsk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Feb 2019 04:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UeTkOIqGRxoaV2Iy1cU85BLIihHHmV6GD7UtYvg9UA4=;
        b=LoAVByjwpyZHeoWq/7pBoLvKh07oc50DCVYHE32bbXuRvhhPabwBWqBgXg/LJQpT9p
         92OZX0IfUkDirJxlgh2eBgRv5q73zymjypEAfa4ol+N8kEixLXmGO88LPdEWyvaKhe9g
         D5vRTaE7JKsWmotzazkqn9eU2ZuXlgQEKy9f4rZl5nN8kzFn4RENkUNvvBs8hlM8bAEG
         p2pjIfqVB4TP3d+5Jo15I7udpKTkiojKIwVaNeeCXzQZC+5aw8R9iChzfcY0JE0ctB6A
         AqkOlv8ByDgewVgIax/IPZ8qq/1u9AGZrE0rAqDtMQS2tR7I6wauB0FpTIOgoLGvrgQl
         BBKw==
X-Gm-Message-State: AHQUAuZlPyxhrR9ZnIufocGw8sWdQi2duMSpRRb1JqBis9PWrpUHtVWb
        7Xg9f3jDGJL2qNfGAV9LCrLBW3xr8sGTx2f0rHE=
X-Google-Smtp-Source: AHgI3IaJtwcQxAZ/E/NPJiHosv/bQkzIpJ/WXJJUq2PFEopdoEJ/kqI3U2utAFWLP6wTLtacf+L1bY1ifThzyyBDZ1w=
X-Received: by 2002:a67:3885:: with SMTP id n5mr12895368vsi.96.1549887506907;
 Mon, 11 Feb 2019 04:18:26 -0800 (PST)
MIME-Version: 1.0
References: <1549710112-19714-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1549710112-19714-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Feb 2019 13:18:14 +0100
Message-ID: <CAMuHMdWNMnHsHQURU6-BT2DAVPGaH_gz3RSf2Xg13ngYgES52A@mail.gmail.com>
Subject: Re: [PATCH/RFT] pinctrl: sh-pfc: r8a77965: Add TMU pins, groups and functions
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Feb 9, 2019 at 12:02 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds TMU TCLK{1,2} pins, groups and functions to
> the R8A77965 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.1.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
