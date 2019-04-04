Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC00C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 15:22:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0243F20855
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 15:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0wY9o2D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfDDPWM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:22:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40703 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbfDDPWM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 11:22:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id q66so2453408ljq.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Apr 2019 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w9eYsOKHsw7lKyfqDdkQg2pfrxwbhJKGP9QgB9y2WQE=;
        b=z0wY9o2Dxm4813RRfTaqexMg4dUvxKyqjzHX/VOkwhV4+XwGjk4HWYcDV1VClOagnv
         mQOAHpLB6LOgP9N225psdJ2Tx5sd6QTogXEYSC+V9at/iX0vb9y4Mwv1/k5VxYlSQF/w
         f2+tSTXrd93tmZEYP3OmNU2KCYywcgTOWNzPBzDZJw/JoZ7ja1F2iog6x1U0Qua0WRwK
         zV2Jb3I+3ngj+IQwsCO27mAFaDQs8vqXq9bENrnQcv2Mwi/86OUjznRfhWi+NQ8Hyl1W
         IrucVqElbpExmmuSAPTylJmRRomWzYYlZIqJSbg5L1c2XoNGFpf8krQzDJBRLHzJkGGq
         DnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w9eYsOKHsw7lKyfqDdkQg2pfrxwbhJKGP9QgB9y2WQE=;
        b=bXmvboSK32cDxZv0Sj/jmsDAuTQcrrQvZzX21WgijxbFMHia3VrKchPOrNiN3MHA0Z
         wmpL1ygRw7emXHwH41pbsZBou75icFQitHQVISKZ4ntgViqC9Fv1JOavVgRlQwEth4PO
         KwZD0bVxS60S8IDaMw0w7G+d49a+I9ptOab4qykXJJDilclu6NtRqPMEZQ3JOafwN3Us
         icR0hj3gS16tcJlew0YiyZKvtsdCPno0DGydRrJQEf2/8irezYyLFhDKz77B9lEehZQ8
         kn7fHHzrCyQ/6Mi4kUcT7rp3jHY6tPT3cOENsQ8s1xOtwS8kF3NwvyZBb26poah48Mmv
         0iSQ==
X-Gm-Message-State: APjAAAXLgzm4rKyj0ssZyv1QmrxdUvBEq99A/153q/djS7ApCWjDftGH
        VsEooquzgRWoPVw6cQzQIakqw7sZur0QNtJ1K2sDzw==
X-Google-Smtp-Source: APXvYqxcIGGNYn922xGUaRjV0eJKnYtegDuL1BxoZOjdjiQHfzLB5/fnA2dJ5L0rpIrdtyQZEbwnOKn3cEWxnEepUCA=
X-Received: by 2002:a2e:808e:: with SMTP id i14mr4035895ljg.103.1554391330224;
 Thu, 04 Apr 2019 08:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190404114154.21242-1-geert+renesas@glider.be>
In-Reply-To: <20190404114154.21242-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Apr 2019 22:21:58 +0700
Message-ID: <CACRpkdYy9KR-fbRB0iGD7YrKc_UM-oM6rCzYPNeWsu2Qd+W0cA@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v5.2
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 4, 2019 at 6:41 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
>
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.2-tag1
>
> for you to fetch changes up to 0a042b355e60269ad30725b5b5ca68fc5371a8df:
>
>   pinctrl: sh-pfc: r8a77965: Add I2C{0,3,5} pins, groups and functions (2019-04-04 12:02:50 +0200)

Pulled into my devel branch for v5.2!

Thanks for the help!

Yours,
Linus Walleij
