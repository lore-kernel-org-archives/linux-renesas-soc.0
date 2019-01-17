Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D024CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F5DC2054F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbfAQKdH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:33:07 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:34405 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfAQKdH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:33:07 -0500
Received: by mail-vs1-f67.google.com with SMTP id y27so5936180vsi.1;
        Thu, 17 Jan 2019 02:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZVK433GAo+z5XEhlrZHOm6bw6LjSZJLZP7A5u2PWQZE=;
        b=iTEexQmDyaa+96EC5g+NAa3xq61HoVPt9yBSKhDcDsl8Xo/UVYUlpXR7UZ7nDFfvQC
         LLY0vCjaWvWJfv3xt7G5c7al+bPiSdKvWxBd0LdRpULZp3cfsHBUS3yjcLaHh5XZd9dw
         7QYkxzFiW2RVDVW/XkOZcK7sRtegWQlvaZaV6U/39GNx9zMIIjv1c5G+lGLsFakmZ7LY
         8qZB53UMbY8qsu6HHkmL3bqQMOUsSAJpamrvn1DRJAYN61Qt3gWNNE5gfGVs4f2bha99
         8fQBq0o6XmAJQ4PECHAAxKVs1Ey+cYBnEnhdPcOxxQkstI7yY6o06Dct199nytST3je8
         17ww==
X-Gm-Message-State: AJcUukft3ghW7yNdg3k8Q9v6kT+o1cNUEhWPPVMu9iU94qjlvXHm6904
        0HxnaeL1IKWbThvLyrZrnB5b8BZvoVdraCYIKL4=
X-Google-Smtp-Source: ALg8bN6OT/o6uKy7K1IxxchaCf7A3AAqSRXPaz3i6lLQQesAJsLvbJGqO4lyeTVh5DAEvugCulpJhW+resb6cbKok1U=
X-Received: by 2002:a67:c202:: with SMTP id i2mr5552761vsj.11.1547721186175;
 Thu, 17 Jan 2019 02:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com> <20190116210555.12209-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190116210555.12209-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:32:54 +0100
Message-ID: <CAMuHMdXVnqRRF0wcjwnQ+ZWA0aYYFXethGgV1tuqxA7kYU_ULA@mail.gmail.com>
Subject: Re: [RFC/RFT 5/7] i2c: sh_mobile: replace break; with if-block
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 17, 2019 at 1:35 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> In preparation to remove the do-while-loop.
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
