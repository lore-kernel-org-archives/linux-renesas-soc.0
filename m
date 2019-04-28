Return-Path: <SRS0=70Oj=S6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8E6C43219
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Apr 2019 20:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68C7A20843
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Apr 2019 20:20:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="mwVtiPIh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfD1UUA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 28 Apr 2019 16:20:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44675 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfD1UUA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Apr 2019 16:20:00 -0400
Received: by mail-lj1-f193.google.com with SMTP id c6so956307lji.11
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Apr 2019 13:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7KWbxY0YCiRu2mr6XWw0uLLps83FNN+PAsNLacV3jdU=;
        b=mwVtiPIht3wIXQDl/GnmQEyWjRGLhC8PkPQHfJjrrc54KsQVrxwcYNksmOYexGftFq
         SPrck4xX4p0W/vSanLx2a8K6vhkannAXkT/YU824nNym4XIPqc5cT/ibnMJSaRKDUxV+
         rRxlODEqW34yolRx2a5pjy7zIie8MoQDx4Z76OuJbC6Wzt5g1m7tKrhGG5QFc5UF4iLB
         nHoVEVYJgKnGy8H0llnz3M+UMedh9lafPAxOsdu7402tT5Hntf3ZGerWAV6U+kR9nrpF
         btB+6VYO0VoILjK/8dItRJsLFDvQV+G0cXCMFtnqmwXNFN72F3jQ9s4rdXIo0z1k1hRo
         HriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7KWbxY0YCiRu2mr6XWw0uLLps83FNN+PAsNLacV3jdU=;
        b=oaJjO/KWRi/Vzvzz8bKjmtIRGyGoy+gqhqaoMKzK7tnoI7Vex1X0uEptmscz4dEqtR
         hANelfg0nTZuieLQf9mbgepr34zyvbAOuvHw4++umBo9BmMPW0+KUMxHd/Vsgjqp1gWi
         HN/JOMufwLoGQwYUsG81Nm5hHwKOXq2bXBnjS4bJJxdioI/23U4VlO2jz034lzhEJ+xc
         QHfZYZcvm7V7uywhfQ7amnfWArYmLGe6IvKMjCZHtIjco/zNSLgSbAhFuUrA0GqtRpMT
         3ZGo5K5gGp33ER9NPkp3PeV1U2ss5Z8Lc2ePun2ulsFRYk4Zc/146aGsEaZtQgi2bFNd
         syuQ==
X-Gm-Message-State: APjAAAVOWPHXkbxLZnzf1ibZb2CGmu0VuE0GoOIPk7nHrUOPiAFYsvKe
        F5YpPVk3LbxJbUP7xNbWJKJzwQ==
X-Google-Smtp-Source: APXvYqzwqlst4RjrSrjdEQY5BByvsRsHWP/xCe7LSEmBxNSk0J/rNAsOoreihU7Iw7x+Oen6L96esg==
X-Received: by 2002:a2e:9713:: with SMTP id r19mr399077lji.189.1556482798026;
        Sun, 28 Apr 2019 13:19:58 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id c7sm7605493lja.90.2019.04.28.13.19.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 13:19:56 -0700 (PDT)
Date:   Sun, 28 Apr 2019 12:46:41 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v5.2
Message-ID: <20190428194641.f3ebdbcy4rnecppa@localhost>
References: <cover.1555684195.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1555684195.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 19, 2019 at 04:35:33PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT bindings updates for v5.2.
> 
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v5.2
> 
> for you to fetch changes up to 3961d355dfb512b1b004e32a382c25a90367e6fd:
> 
>   dt-bindings: power: r8a77965: Remove non-existent A3IR power domain (2019-03-18 10:33:58 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Bindings Updates for v5.2
> 
> * R-Car M3-N (r8a77965) SoC
>   - Remove non-existent A3IR power domain
> 
> * Add vendor prefix for Silicon Linux

Merged, thanks!


-Olof

> 
> ----------------------------------------------------------------
> Biju Das (1):
>       dt-bindings: Add vendor prefix for Silicon Linux.
> 
> Geert Uytterhoeven (1):
>       dt-bindings: power: r8a77965: Remove non-existent A3IR power domain
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  include/dt-bindings/power/r8a77965-sysc.h             | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
