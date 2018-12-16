Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D56C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 00:19:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 086412171F
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 00:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzd96s5c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbeLPAT5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 19:19:57 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38047 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbeLPAT5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 19:19:57 -0500
Received: by mail-lj1-f193.google.com with SMTP id c19-v6so7988994lja.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Dec 2018 16:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EhIEKrKvTARns+d0OwN48zAChWxoAeSosNOe4O6ia7g=;
        b=dzd96s5cKbaY4OHH4JtX0xUsIKsbiwj/EaSnJG9jm9+DLmaSZ9YM3bb2IUyOf62N/g
         0laaS3Gw13LLEmwpdBqtg/Captp3c8O7FznJunvElRdv788tL0IbAseeiXmkj3ES0eRi
         iFAY7IdJNOf0bnmJdq9rHuLN+UuWjx7RmqOe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EhIEKrKvTARns+d0OwN48zAChWxoAeSosNOe4O6ia7g=;
        b=RE1pQRemfuNrfMkyXO2tc0d/tS77jM4DSdPXkPNPBkp0bAwRbA/hQTK3248N9Fc2gd
         WjnZKNofd3fFzdvmtipcjx8ls4JNnLceTxa932m5VJY09pGaCOAS2vKRUzUptanEjrbB
         WdqBhr1BqntnMfTFmK9Gv6/iH9D72mM7NbRNOhUVmDo731BTd4W5oByEpkk4pkrF16/l
         Mw6Fy2+iWE1KDLEWQPJlS9TGl3V013Scs03lMlD3iBH2hVVI21oYb3YMpZYyMukR3OJf
         3LEGmuid6qmfOzMPYtA8FyBOi8W39BBGuXhuOvuu4ETPmoTLWrwbfJbw0RoCFJDZ2/CQ
         91ug==
X-Gm-Message-State: AA+aEWaoscRtYcmh0HcTRV5azGmAMV8ceYmQbSyhyiQCpNxUt3niAIQX
        YnPr0se0AMmsgNNdM3WedzhLfIxc0AoGuIeAY/0vUg==
X-Google-Smtp-Source: AFSGD/VKShKq6RP/WsQx76sv3d5u1oBBVSBbjqR8vt/ZIhqv+BSojWMLIfVlGID1AsLVcFOSVjkmiCOp2nk3XekOgWk=
X-Received: by 2002:a2e:9107:: with SMTP id m7-v6mr4634458ljg.23.1544919595222;
 Sat, 15 Dec 2018 16:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Dec 2018 01:19:43 +0100
Message-ID: <CACRpkdbpfxoSiXYskq7FS_Frb_q=TeZ2KNoiC5EPJDUB0tbegg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: select General Output Register to set output states
To:     Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 10, 2018 at 3:22 PM Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> R-Car GPIO controller provides two interfaces to set GPIO line output
> signal state, and for a particular GPIO line the selected interface is
> determined by OUTDTSEL bit value.
>
> At the moment the driver supports only one of two interfaces, namely
> OUTDT General Output Register is used to control the output signal.
>
> While this selection is the default one on reset, it is not explicitly
> configured on probe, thus it might be possible that kernel and userspace
> consumers of a GPIO won't be able to set the wanted GPIO output signal.
>
> Below is a simple test case to reproduce the described problem and
> verify this fix in the kernel on H3 ULCB by setting non-default OUTDTSEL
> configuration from a bootloader:
>
>   u-boot    > mw.l 0xe6055440 0x3000 1
>   ...
>   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led5/trigger
>   userspace > echo -n default-on > /sys/devices/platform/leds/leds/led6/trigger
>
> Fixes: 119f5e448d32c ("gpio: Renesas R-Car GPIO driver V3")
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Patch applied for devel as "non-urgent fix" as I can't see any
immediate regressions.

Thanks for your thorough investigation of the issue!

Yours,
Linus Walleij
