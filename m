Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DCCC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 09:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B44892075C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 09:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfCKJu6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 05:50:58 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:44797 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfCKJu6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 05:50:58 -0400
Received: by mail-ua1-f66.google.com with SMTP id r21so1293674uan.11;
        Mon, 11 Mar 2019 02:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRQ61COUt3Jm7Diuw0zDMnpHyScCgTfYP2D+1+6gQcI=;
        b=LlHntc/GRig2jXgEfj4lqd68S1rEJDXoCixwxVg43JDSyb9rRuO1rS8CSSaRkpC52W
         v3K14kWTooix3RIva1oOWNgFinQ6kcwecLxskGB+cE2w+pMyiwtKclAWJCAsVneuWYq+
         Gc06GJ2hw4SabQTqpJ9xazOksUzycVPzR42Chun9o/svpxNpk48s5v5B6arxAH8JIWvT
         s3lgu8fHMkHa41ONc+PLAy62zR1KFrxz9e7wsiFE2MaKlM4asjdpR8gqeorbaeMlkEef
         ZtZELwVllF7hY1OAHYFPBNrqfy559rhUonZzysWnqwu1UQAErGLotW2R7HjrakgaeTKE
         bl9Q==
X-Gm-Message-State: APjAAAWzOtpizX9eVBO42RrW+Pfc6EmNbXapzAubSsW90gvjnIRbEoeN
        WpfdLG3AzOVV9Mqe2DDbjlKh+dPZzyhbmieLpbI=
X-Google-Smtp-Source: APXvYqwv7nz4nyrxI/qGKjRYTyqpiTLAjL+tTKJaMMXKsrxuqXPy7fdXf0GusNTpvzSUcpDDXQoYtUs3N7YPKL0l3fA=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr16132022uao.20.1552297857210;
 Mon, 11 Mar 2019 02:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com> <20190305175434.13107-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190305175434.13107-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Mar 2019 10:50:45 +0100
Message-ID: <CAMuHMdVtTiZdjVkO2WSdafEsTcVt4DvbMfyByA-z9O7XrGeK+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: rcar: let DMA enable routine return success status
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 5, 2019 at 7:11 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We will need to know if enabling DMA was successful in a later patch.
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
