Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D5FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 12:12:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 782622054F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 12:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C19+Y6Yp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfAQMM4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 07:12:56 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39541 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726914AbfAQMM4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 07:12:56 -0500
Received: by mail-ot1-f68.google.com with SMTP id n8so10886451otl.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jan 2019 04:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2i62l1RZ2Xxho+N5+QceoL6NMK+JFFGPVOl2S8RZleo=;
        b=C19+Y6YplMQFh5f7nkzET5jxbKi008OCEGVdsEZ95dtpos84JszUI53bIGzxuYAoT5
         Z/MLeyBK45pSrSvTanHN3jIQTrXRj+pTe07CZdEZTeG15DFJO3dgasMGJrC0qKndUT24
         3d6ghq5nb86I3tAUOG3SHutWIEx2U08+1JR22nwbOy05joJEhjMKwJEV6EAJpSCK0wYI
         zg/nzlDEjLPTg2dqYI9YtymAwKr1Qj6LNICsJ3+9Wzn9kniXsnZxCoaVTl1cHNlnbpAl
         O964qtNjrnu4JNo9KO5dLJJX5piYH1utgfmc1wOKFiMNLn14r+dmW+qxOawZ/hxNP9w0
         VkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2i62l1RZ2Xxho+N5+QceoL6NMK+JFFGPVOl2S8RZleo=;
        b=qbZuw2ABDv5gchpFh0C/8isJRcXsC7p+VRvVX3tQhEuIbttzA52GDYJdZQQmsZ7BkJ
         71+UvyaAsIml0HKJm0PjsPetQX7/p8Tf1t20h3+7tMAPkEl0pbEz2ni3obM2qelGisan
         aWqE5rnfwGUdj8bPhKVdHpRGRqpFNEuhqcbe0LHm5y6P7kdxKZi2Lu0DMoemvzcx60e/
         IRgi4VsJTJZh1WC/fa681dGQHDz39rwPkDD6VnoBRDhxvjb6fVR/z2LHpQj/bv7wlQ9+
         CWlnNhwcaJwbdIlqs+XvgG8EGpZvHt6Xs5PmA8Iz73BZGSzz6U/DEd5TCjgZgIX1FI7j
         0jCA==
X-Gm-Message-State: AJcUukevOahowOdn+STV5dSYk/jNSvYy8jF62rAqEBkzbBkkEiAkPNs/
        XQv2L7y+TID4vrJcGjdkH0kujN7Muz76yisTlqQxMQ==
X-Google-Smtp-Source: ALg8bN719629qaqKSIGYp7xBXIRw5W9cIuUN8efeUgyoEDHRRaUdV+VBRcXWwFxxNAb27qAh/Ex59AWKx5+WRrFlPmM=
X-Received: by 2002:a9d:6191:: with SMTP id g17mr8790446otk.56.1547727175952;
 Thu, 17 Jan 2019 04:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20190117101321.2164-1-wsa+renesas@sang-engineering.com> <CAMuHMdWtXA9Q66vCuG6U-+04kqu2F=DOA63pTkeMZ06EzfOQkQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWtXA9Q66vCuG6U-+04kqu2F=DOA63pTkeMZ06EzfOQkQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 17 Jan 2019 13:12:45 +0100
Message-ID: <CAMpxmJXEs1Lg775GtNq9p-feVW3yGU_yJM30n2OOgsm1i=2LUg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: driver: fix wire name for I2C
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

czw., 17 sty 2019 o 11:24 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
>
> On Thu, Jan 17, 2019 at 11:14 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Typo: the data line is called "SDA" not "SCA".
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Applied to for-next, thanks!

Bart
