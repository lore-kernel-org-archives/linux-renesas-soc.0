Return-Path: <SRS0=Vdsz=QV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099E2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 08:04:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9A1A222A1
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 08:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQp9muhQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391807AbfBNIEH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Feb 2019 03:04:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34766 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388779AbfBNIEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Feb 2019 03:04:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id l5so987173lje.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Feb 2019 00:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghUxM9bjDJJxcwAKlGMh9PrZoPIiztM5kGeucDnmCN4=;
        b=nQp9muhQbTm/Soogb6B2Mpt6O0M6I3ArexxJA8vk7TZWMRzamYgjAoaaT5+YhtzjPv
         ehbGOc7lMcNvE9bTr/NrG3pXIqTotEXIEGbxumJTTWNIVaiW0j2qlRsDlrDy/rQu5gNe
         CsSUD16qCvYbQummoKw4aQfitmVF4H09f6VLMs/TQX5kSk/pTz4K6i1AKx3rPIudt5kQ
         KHHcIUgs12D4d/wrU29Dkj2pYI7PPoL0+T6MhLTtm1i/MukiWlB9RTlXFcBb0jXEQMzX
         nYeraTszm5gbsy6fo+dHEv8kVz1kXsitOvLNPdH8FzYxixi/nUutCfDHBmQiyJEMxTcc
         aZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghUxM9bjDJJxcwAKlGMh9PrZoPIiztM5kGeucDnmCN4=;
        b=CVVduR605kD6VynivNiwAkBsyIBiH7/s1Jvwttc3QRkc7JR8O0NECFW2VXC2HvrqAa
         QGU1u4H0Jgyb7qyGtWKuyAymAw/yE/7NOQfOOSEL9y2ykiM5is0FCcyNnJmSef2aRQES
         q4v5+cHhqjH0+DydwEcnDqoo3yEJhkJAPREg8wA7XsHXfmCCcwfP7n+idx/cW2YpG7QX
         fBXkuDQC9I85Kvsp0s07nkw+2dqs0c7CGamYYudUfJCa+hMPQyD2EXvyhUorszKy13Pw
         fP+A3sfweHEDwZS11QJVLvLLEjonnctw/2M7kSCIhlShUh9b0zF4aoTyBD/ztOGYkyl0
         0JxQ==
X-Gm-Message-State: AHQUAubhICNrhK4fUENUOILug7Gr24qU4RV9O72EqydKAo9igXAvt3Jk
        BTAqdFV8WgqIiIAeFRK8dlw6hY4mpdfBCjACH295wg==
X-Google-Smtp-Source: AHgI3IaJg1WJ4l8GWVXdm/uoYBzyE8iL4mu0qpG1mXSQxAa6p27aCVWKgeTdYrjHvytcjrkBlEmtWDAQz3/EgclTXbo=
X-Received: by 2002:a2e:2d11:: with SMTP id t17-v6mr1447608ljt.159.1550131444643;
 Thu, 14 Feb 2019 00:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20190213131409.26607-1-geert+renesas@glider.be>
In-Reply-To: <20190213131409.26607-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Feb 2019 09:03:53 +0100
Message-ID: <CACRpkdYbW1biruWYdr3fCsUcMUHR7LHP+SuAnGfvLbTRf_z0ZA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pcf857x: Simpify wake-up handling
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 13, 2019 at 2:14 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Unlike gpio_rcar_irq_set_wake(), where this solution was based on,
> pcf857x_irq_set_wake() does not need to do anything else than calling
> irq_set_irq_wake() for the upstream interrupt controller.  Hence there
> is no reason for making this call conditional, and no longer a need for
> keeping a copy of the interrupt number that also serves as a flag.
>
> Just propagate irq_set_irq_wake() to the upstream interrupt controller,
> using the original interrupt number.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I can no longer reproduce the issue fixed by commit ffb8e44bd7617ede
> ("gpio: pcf857x: Check for irq_set_irq_wake() failures") on current
> kernels: if .irq_set_wake() fails, system suspend is aborted, and the
> imbalance on resume never happens.
>
> Looking at old logs, the system used to continue suspending, leading to
> the imbalance.  Presumably I could run git bisect to find out when that
> was changed, but that would require downgrading my cross-compiler (Linux
> v4.1-rc3 didn't support building using gcc-7)...

Patch applied (used some fuzzing so check the result) and incorporated
Niklas' review tag.

Yours.
Linus Walleij
