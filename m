Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F856C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 09:02:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C10121773
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 09:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIBoId5G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfBTJCD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 04:02:03 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35160 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfBTJCD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 04:02:03 -0500
Received: by mail-lf1-f65.google.com with SMTP id v7so16992193lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 01:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EE1CuSpIwbUQSlQlHEp8pbMqrzzS9SZsL2FB+OJKHeI=;
        b=FIBoId5GeIXyFLY86TsxJxfO2GuVcNGDmcwHWqPEvj7/6Ta8MfVJsECFYH0iDMlR4C
         Q+NzwuC1sMT7FOChiUshc+aM3GAWNbBVKE8DwYOHUWvszT++KqckKmyQMvP24TdSeXkb
         2z/POIAWaUQ4SY7SMdVC7syLzMwNUDDgo9PeU0HGayqgRhul3BxEIlAQ0fcPTcXw3fgZ
         yen5AvpYn7uTwEUU7zsTmZeKpGjy7DQ6hPU3zfsxbIMB/+mqVFGCfneJYnmVEjYnwG06
         ZrMX98Xk6M4S/2K+uQSLlcIOCjNM67JqkA4dhDLyQUP3ASna4LjrXrbTMEZyckVmVGd1
         gVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EE1CuSpIwbUQSlQlHEp8pbMqrzzS9SZsL2FB+OJKHeI=;
        b=uicj+o/DAum+ltHJmHcN4Em7WEF+B1Ob5yW8UgHST4A9AlVvOvjPQZkUow5M53TQM8
         3yMm5g/vV3x1xpXVox1oackeVqWE/bn+f6rvb4Cn6l3NV5OrVnr0USWs1LR3wBQkNsSV
         a6ryfxJieh7xvztML2zWoXFhTsUzpgD5YzaZgWpOGqaEXYfV6jQSXbWKVqC6BbvHkn0l
         IiJTtczetO4wRSb4NSX9SRDQqOrnMCayThIvsOo/ZW/L4Z97YJSCEOucueWgIpgfkWMM
         Q8FUUp1Gzfjr/z4+9uFcfi4GaNgNbadFIORKq7HN9SgmpNkZCIcqirA9o7oqjUiY4CH+
         ZQAg==
X-Gm-Message-State: AHQUAuZUo3//7IV96s1TMBLFZvxuWbFZx5CXH98usTOf3WyjodA3CaHg
        A9sz64DWOpMBlBjSeatUHjXEBfmeFccGIKQHt4pRKg==
X-Google-Smtp-Source: AHgI3IZ9Zyz8EYHANpSg2YwGQnsM3G7KFepVLF6vVKE3FD+9XrhQvwxEVvkobX20BS/xeBwpcESc5enkETb9neb2OsU=
X-Received: by 2002:ac2:4343:: with SMTP id o3mr17825675lfl.129.1550653322246;
 Wed, 20 Feb 2019 01:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20190216134627.1601-1-marek.vasut@gmail.com> <20190219151811.GA13354@ulmo>
 <631beb2b-786e-e182-acea-561b0706b041@gmail.com> <20190219160800.GA30280@ulmo>
 <805f638e-2d55-803b-b09c-617d3a503408@gmail.com>
In-Reply-To: <805f638e-2d55-803b-b09c-617d3a503408@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Feb 2019 10:01:50 +0100
Message-ID: <CACRpkdb6g4fd2bXg81p1+iQ4Vgm0d+Z3nW38qy9D+romM0aj1g@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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

On Tue, Feb 19, 2019 at 5:30 PM Marek Vasut <marek.vasut@gmail.com> wrote:

> Handling broken DTs only adds to the complexity, but I think this cannot
> be helped, since those DTs can be stored in some ROM.

I agree, but if the broken DT needs to be supported going forward
I would like it to be quite explicit, so that the code down in
gpiolib-of.c does this:

/*
 * Comment about this machine
 */
if (of_machine_is_compatible("nvidia,problematic-board") {
   /* Quirk for this specific DT for this machine*/
}

This makes the standard behavior clear and avoids the risk
of applying hairy machine-specific quirks to any other machine,
but even more importantly it makes it easy for people reading
the code to see what is going on and why.

Yours,
Linus Walleij
