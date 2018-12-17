Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F07C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6793C2145D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbeLQQXV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:23:21 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:35416 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbeLQQXV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:23:21 -0500
Received: by mail-ua1-f41.google.com with SMTP id d2so4634216ual.2;
        Mon, 17 Dec 2018 08:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WNcGB0P8BB700X1HN1au28deKW0CxBsNKnT6DAO0740=;
        b=Mxj1ppZRQGyGHuDZ3oxtzCyMUNA8JoeavvGqK7Tv27u3qqiNF/7K4S1ywmt2o5D/sb
         KkD8G1l93MJfL8By9jd/ss8zzj2863ZNW4gh0TEJFyc424CHPZN5VWKVXYP81Xfmh1e9
         bOFQKQaSgoVQBks84zNE+U4u+aabZUfa9pp8AmSqE+pyglrwaYXt6sGRpxCFUmv1hxWH
         AESuB9qqr/D79RK0m3S9saREtZ8wMfbsT2mnE8mTAMnS476cjTKMLGylOxWBpDVTAV9F
         6IGx4ofD67WNayLaFBgzrU69L4ZmV9dsG6oQvymDcuDSDt1oAnEM+gluSKP1w3OoqPk7
         d5Kg==
X-Gm-Message-State: AA+aEWZhF/vVrcxlBMwE45V54sZYYwV0kBSC0igvJC1ZvvHkAzdKgrLt
        RBP1ZdaWWBEldF5eUN8Bdz/ZimiGovAlHU7Mlpw=
X-Google-Smtp-Source: AFSGD/WlcRywfpMlFcMezu0EQtMwAdP3eajqNIXIJO6oUFNu400vHohfcvY5RLYpnnQuhZLo60M7+ZzYemfGxlegeyc=
X-Received: by 2002:ab0:465:: with SMTP id 92mr6535549uav.28.1545063800231;
 Mon, 17 Dec 2018 08:23:20 -0800 (PST)
MIME-Version: 1.0
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com> <1545058221-22529-3-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1545058221-22529-3-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:23:07 +0100
Message-ID: <CAMuHMdUVBO6Q6mfYth8H3aMQRKT3A9Sy_-LZr9kNh0KTveU0BQ@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 2/2] thermal: rcar_thermal: add R8A77990 support
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux PM list <linux-pm@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 3:51 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> Add support for R-Car E3 (R8A77990) thermal support.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
