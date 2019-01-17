Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F077C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1A422054F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfAQKZZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:25:25 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38861 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbfAQKZY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:25:24 -0500
Received: by mail-vs1-f65.google.com with SMTP id x64so5891278vsa.5;
        Thu, 17 Jan 2019 02:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7yxXKds/+ykv9AVC/BmQjCwD+7YiHMSRuWQzTl3evQ=;
        b=Mi2baw36A4RAxf0oGKhi8HKPz+9HK2q9W+v3yFC+0o5NCP7swGBiOurFUvGekHJTZW
         1gNxoZUlApSMt+WhH/J24pmZ8lb5Z/IkMGLcrHOs10/8CKl4ImX3DFSQoYZb6FZhH4MN
         sJ/HB0FrImP6KKp4ZveWz5mginVitHg0ifxxcHE2o6H7834lfpkdUywY1043UDXswLyj
         9gTVPEF2mEU8YVACvPILgf1bGL1Tb2fp07w5j1E0otez6D5Wmv9isvmLTmySGuTXHgAj
         bBVlQ7oJhQtxm3p3Ys11lBLLLSyjudrshvlgqy2Qc09bZOBPewhINyRg12PguLcZ79YL
         EKfg==
X-Gm-Message-State: AJcUukdiQQavl3kxjbPM7s2cpIocwtj4AbSWecMePt2zDvaLjd2Zb/k+
        ruf1irtNM+bf7fzo8DJEkk2aMALJHakukFpmhFLq5wZE
X-Google-Smtp-Source: ALg8bN4pKjKxmHbrdiBKmVpqLeWsuQm6B7VY59C/9/QxtYiNrqNqedX1kxt398Jv1/V1cbdeTBY9AfSRSY7NivhlNpg=
X-Received: by 2002:a67:c202:: with SMTP id i2mr5544284vsj.11.1547720723860;
 Thu, 17 Jan 2019 02:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com> <20190116210555.12209-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190116210555.12209-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:25:12 +0100
Message-ID: <CAMuHMdW+=JMY817ox+mQGfnbixpXzZyR4MOUyUFxWCP5bK0T6w@mail.gmail.com>
Subject: Re: [RFC/RFT 2/7] i2c: sh_mobile: remove get_data function
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 17, 2019 at 1:36 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> It makes the code much easier comprehensible to explicitly code that the
> first byte will be client address and all the following bytes are the
> actual data.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
