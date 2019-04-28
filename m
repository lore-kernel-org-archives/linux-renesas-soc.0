Return-Path: <SRS0=70Oj=S6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE7FC43218
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Apr 2019 20:19:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96DF52064A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Apr 2019 20:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="NiV1mYCr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfD1UT6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 28 Apr 2019 16:19:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44674 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfD1UT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Apr 2019 16:19:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id c6so956263lji.11
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Apr 2019 13:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yaTCRND8SN4oOygY6NxcMWQHkTGuaWnRyr29b8jdPRI=;
        b=NiV1mYCrzn+fY40nRhMNwLaCtJOq0+Phs7ysEPlDAck24wXW8Ajq7OEEnFf+ZFwCek
         ZYN5jCgg58c7ZsJDItzL1BOxJZR5z6p23iea5T4UyMGFtlw7vCMfaefOy2qlPdLuyCIy
         Yiq9IR03ajhKuYPyCLiiCuRrlUsjMuvwbU2TtpVLBzfiflLryONkAz+u1Dc+OhqcMOYa
         AKP2BP4J9ff4Bz36d6ZuZLW21CbYyo1cPMVb2kOgNahTMorUW8khbB4/IStegKYglHvu
         G19+C7h2FZRjhtKD9XvMFcSxup5Q98ys+8t5u5T7jaF4xduqOnAB4VEIF9QigdfhJYFx
         1zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yaTCRND8SN4oOygY6NxcMWQHkTGuaWnRyr29b8jdPRI=;
        b=cx4r1G+LKAG7HEfg7RbNtBw4jOb62mTK3qraLjosXwDuG3Cj1h4RrFiSyDzmxxFmdo
         w/Me1wIMezjO59U12zBwerX8Wt8oj1fac+Q2Lno08YdNR56/yJz9zwBKNp+BrOQwIJPy
         2vP4O8uFlB1ZyTSJbMlRjG83Qsq4Y+QkGruV6OM27fAL7zFMlFIaAAQuBY1iB8f0wgbu
         gqVWfO3wDygtmY5JekPRGYfRhp1keedktLob1xjrbVnc3JKX4/HIun8ObF01rUMUDSdP
         Wwq858dt165dSc/6plPkSuqY2RPsRVdrbqcBLpE7mZHLyd2nRPhE5oMf7KXPJZQfVKzV
         b6JA==
X-Gm-Message-State: APjAAAXOgjXsVit7/e003L3jKJtzQgsdwNvccrYUuahs/feTj0X5385e
        EFzeYdfHKwJ6A98XBr6KSiqxRA==
X-Google-Smtp-Source: APXvYqy9uF62GnHMHrhhELvU/hKPNqjMMu2OTDWZkbrhNJ6wFx2h6HUU5riwnSma+iQzpQCoj4yp6g==
X-Received: by 2002:a2e:9dcb:: with SMTP id x11mr15091268ljj.123.1556482795958;
        Sun, 28 Apr 2019 13:19:55 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id s26sm6560256ljj.52.2019.04.28.13.19.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 13:19:54 -0700 (PDT)
Date:   Sun, 28 Apr 2019 12:46:14 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Updates for v5.2
Message-ID: <20190428194614.eameiyhj6pc45wkb@localhost>
References: <cover.1555655522.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1555655522.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 19, 2019 at 04:34:47PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT updates for v5.2.
> 
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt-for-v5.2
> 
> for you to fetch changes up to 0750e8344eb7c48f82a54920172a5d0f78eb223b:
> 
>   ARM: dts: ape6evm: Reorder bootargs (2019-04-17 17:47:37 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Updates for v5.2
> 
> * R-Car E2 (r8a7794) based Alt board
>   - Enable USB and DA9063 PMIC
> 
> * R-Car V2H (R8A77920) based Blanche board
>   - Enable IIC3 and DA9063 PMIC
> 
> * RZ/G1C (r8a77470) based iWave SBC
>   - Enable HDMI, USB Phy[01], USB2.0 Host and HS-USB
> 
> * RZ/G1C (r8a77470) SoC
>   - Describe DU, VIN, PWM and HSCIF, USB PHY, USB2.0 Host and HSUSB in DT
> 
> * RZ/A1H (R7S7210) based rskrza1 board
>   - Enable remaining LEDs and I2C
> 
> * R-Mobile A1 (r8a7740) based ape6evm,
>   R-Car H1 (r8a7779) based marzen,
>   R-Car M1A (R8A7778) based bockw and
>   Emma Mobile EV2 based kzm9d boads
>   - Tidy up bootargs
> 
> * R-Mobile A1 (r8a7740) based ape6evm
>   - Enable NOR FLASH

Merged, thanks!


-Olof
