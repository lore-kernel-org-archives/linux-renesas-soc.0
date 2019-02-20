Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25366C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 09:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA58D208E4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 09:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cF6IL0cu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbfBTJHn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 04:07:43 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35590 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfBTJHn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 04:07:43 -0500
Received: by mail-lf1-f65.google.com with SMTP id v7so17004433lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pw7JgzZVzimV3fUe9Nbqm3dc8LJTLfwXZtsGMlsuzqQ=;
        b=cF6IL0cuNlobWjZ2Onv7AphfqMkCtHaN+NEZia8+b9xTyLlNnaavaVMYyEW2a449sk
         eVj5D8Sfg0hn/piVmQ2Ift0lyCo2F6NdCBFt1yYj58K1vRz3aIssLYODxt3PrDpWzqXy
         R+k9ZbYQbwYQjlHvB3w5oqsxK3OcsoJK6dqz6ZGedmYfBvNsNxr7Q5Lcf0SJikDJVlyB
         ql5+K4taRWdv4UpDMqSoNW1wpylAJZr0sBYIaKD6gjIviPj1A7o7QO6CtLr85oLldkAK
         DD8vWdMm2kapEbxvv5+/vqQQrYV+4RvRS8h2RrakHPCfu+MFPMrR8vrqonLgYEQ93qEZ
         hWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pw7JgzZVzimV3fUe9Nbqm3dc8LJTLfwXZtsGMlsuzqQ=;
        b=bJpdkKFAHYSIUvyKDu8J4KIHq2H2FpeNpfA/2mILqGp005scpxzV72qXhgwbteoXpX
         TyqGHSboPdp9PW+ivfNpfkdh9cMKGkp1IOH3b7WAV+NoPg77lL+sTBkSUFomhkeT9PtV
         jpeQzmHT0YOrq0QdHDG8cVnUVIb3h/iLw5sgYmdCNkh6Z8j2m/J5t50aZDxaMSy5s+/j
         W4Z3ejIizOVkrLBjioI7+sEGc5kM5r7+PIGHyM2npYQkKEuuzedUh42+5YldzXTjhWBV
         XQjuXOajgwnJhg7NESo/aZEU6D/9kUfnxgCw2iHYxwdMPf3mR1Rb8afHaLzhi74ffbke
         WkZA==
X-Gm-Message-State: AHQUAubq8JBKER3j+oJL+T1iGIdR5+XWvGtESrtpHR98+o6RkpHSN0rS
        dngwjMDxhdocdW8Hd45FJlBvgHoO+CY2CWjFLThiXQ==
X-Google-Smtp-Source: AHgI3IY5mYjEpQw4MTmoDQCvzcVugJJKhnXlfrm4mORKvXNvMNgenocDdL0LQAlK9sloVR2fPYM8Eo1meocfwqIqGVM=
X-Received: by 2002:a19:ec0c:: with SMTP id b12mr20779939lfa.27.1550653661072;
 Wed, 20 Feb 2019 01:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20190216134627.1601-1-marek.vasut@gmail.com> <20190219151811.GA13354@ulmo>
 <631beb2b-786e-e182-acea-561b0706b041@gmail.com> <20190219160800.GA30280@ulmo>
In-Reply-To: <20190219160800.GA30280@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Feb 2019 10:07:29 +0100
Message-ID: <CACRpkdb9WSw_mY0bxx8PrJc0N1ze6_og6hHTNUppLmxsb7NKBg@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 19, 2019 at 5:08 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> Linus,
>
> can you squash this into Marek's original commit? I'd rather not make
> that two patches because that would potentially cause bisectability
> issues.

Sadly no, new development is merged on top.
Bisection breaks sometimes, it's just how it is.

(OK if you tell me off very sternly about how this destroys
everything for you then I will have to revert all development
and re-pull pull requests etc but I'd rather not.)

Could you send a patch fixing the patch, preferably along
the lines of
if (of_machine_is_compatible("nvidia,problematic-board"))
as I outlined?

Yours,
Linus Walleij
