Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4F0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 00:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94D592086D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 00:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="S06F/awx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbeLPAGr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 19:06:47 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37079 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbeLPAGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 19:06:46 -0500
Received: by mail-lf1-f67.google.com with SMTP id y11so6913257lfj.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Dec 2018 16:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A1V2Lv54PZ5B5z73tGjpT+iTVSqs8k4Yxfo+Kt30FQo=;
        b=S06F/awxINWk98MmwQgVHXerPdV7scYqaG30IcPut3ECT9GJyw4eTYftAP/5ZSRB/J
         1D6wrALmuqip2g8g+J6tZCs34rGB9aDpFad8winEdGkg+mkLqitu+GAGuSPbkTS2Cqwe
         VqdKgIWYgcpohPKqqbDPxEXf3API7MWNfLmCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A1V2Lv54PZ5B5z73tGjpT+iTVSqs8k4Yxfo+Kt30FQo=;
        b=ZZTWjRhN75r8CDbiRRaW/uiyWpjBa0Vvsve4ZImikEsUb4DDgZIOxsLhLc+UnfSHoc
         TN/pPZONeGKFlH0ZJug92QOmYZLKOd37vm46foBh2X8D1jYxv6mXnBAV0Des4UVWQqDg
         oeSrCyA5KRMemSox/sCFPlNltanWFohSpLPMCmEZsjmLZdnPMylcixq3C1zDXsxW5hc3
         F38dB1kmQhxOqdJJ/Kw9HTUOM8FW4wq3khGto2ASptNOgrRuP/22OzWLrX2bG/vmRwMC
         GG/0ECryKcNrxYViQprAjC0bPu8/EpOLC538DXVs88SEiE5X+BmS/bAiCe9uuHm7+eCi
         1nKg==
X-Gm-Message-State: AA+aEWbAgOqrt04VUbSkR+otx+xidFnKEFmHqiPlaUL6+WVvrKuJdJf3
        ZZ79rXkhkI3XNmsTPsHRf7aAFMjWOCDmO/Pc+wqGew==
X-Google-Smtp-Source: AFSGD/Vc0y1OSnx/3SXp/5z+vICavJ8Ln9bHXGqFqGQhx3xEeJjjBEV3djmig53gt+bIzIDkba182jWU6s5h2PnjFJ8=
X-Received: by 2002:a19:f813:: with SMTP id a19mr4312697lff.67.1544918804827;
 Sat, 15 Dec 2018 16:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Dec 2018 01:06:32 +0100
Message-ID: <CACRpkdbgPWOy93UYVQW69F6fRxggdQwRsQg7v9eA+sgtimeTDw@mail.gmail.com>
Subject: Re: [PATCH V3 00/14] gpio: pca953x: Code cleanup and regmap conversion
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 15, 2018 at 3:26 PM Marek Vasut <marek.vasut@gmail.com> wrote:

> V3: The only change is in 10/14, where we select REGMAP_I2C in Kconfig,
>     since the driver uses regmap now

Oh I already merged v2, can you send an incremental patch just
fixing this?

Yours,
Linus Walleij
