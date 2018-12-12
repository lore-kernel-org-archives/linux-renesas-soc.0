Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB189C67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 22:16:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B053620851
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 22:16:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="Iwd5NtL4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B053620851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbeLLWQT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 17:16:19 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33717 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbeLLWQT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 17:16:19 -0500
Received: by mail-lf1-f68.google.com with SMTP id i26so26101lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Dec 2018 14:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jWeox1QMSA1rcqXOTQM7uLfM3BrUU26ONRQE87Mb9QM=;
        b=Iwd5NtL4tzqyo6Uf2eM6TUt0YB2OGnZ6tcxKGGbUkBdZXFb71sDaGWOvJ2dwjLfUSS
         5cCiDME2/jHzsfYGek/qsdBdtR+NIiQqgh1kEfAABwy2L3edcFL0Qgn0SaLkTXoRsTZZ
         r0k3B1mMFaXUttZTOykPNHiGd8QOkG9tYSFzcuVSMOHWpYDs9nrbmWzYwQ78bJxefQXX
         sFkuAPxt1d6Rlf1ISedzvBglCPJhGbDxtRpgYi2mNZ0vYqvelg95Jl1jPO8m0T3VZ+o8
         mwFwQvRBPn16jwtGZ5bNtqhDPFoXWDgmXWU/6VN0oDbW+LpyP79NeHlXOJNnke6F5LA9
         tCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jWeox1QMSA1rcqXOTQM7uLfM3BrUU26ONRQE87Mb9QM=;
        b=ppYPPG99jQGec729IgmINKyKnxFhkvj7OdkjvF1BdjqTVjEiOgj2WugDLw2Iz0pF7L
         rrU4dHqU9vPc0s3mebKBj4O53gw+5Mmvcg/CnI3wcd++h8j9K1TBYy7N4rhZht4oHvic
         FE5JT6qBFOa8sPBe11BzA/tYfIpRgCDMh9NoRoBkkDA2ELOrKgxtKZciOzDe7JgJUfdN
         HBhofAYeo6ZQX99vpLR0oyv/5ez0+R0RSv/DR4y3mDGCqSEpkCx4kuKPYMWQhg5pafqF
         7eCQLemtWecLJe/UHo3ag7AxzeHWmNyMqqvIU3I+CcwWav8jjrrAaMA1cfC+2IYVFq6B
         Ge8A==
X-Gm-Message-State: AA+aEWZDxHcI4/g3Zd/SZmUZBdfdhatR/suwPFf/+RHek0emePTl8Q1d
        Q7FABX3QLZGIZa4EQP15kjol6A==
X-Google-Smtp-Source: AFSGD/U7UNus+oM4OClsTmIw2ZJ1m2N24T3vBwfPO0P9BDA+OoPpq56TqFTCSgCE+tKeuQ2n3Jyp5A==
X-Received: by 2002:a19:7111:: with SMTP id m17mr12258168lfc.64.1544652976263;
        Wed, 12 Dec 2018 14:16:16 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id w202sm3267lff.31.2018.12.12.14.16.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Dec 2018 14:16:13 -0800 (PST)
Date:   Wed, 12 Dec 2018 13:43:19 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.21
Message-ID: <20181212214319.biiarkxpeqvh4vte@localhost>
References: <cover.1544124535.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1544124535.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 06, 2018 at 01:57:46PM -0800, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC defconfig updates for v4.21.
> 
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v4.21
> 
> for you to fetch changes up to 65a8c17a39f62fd646950fa43efcced0d6fe029c:
> 
>   ARM: shmobile: defconfig: Enable SII902X (2018-11-05 12:41:09 +0100)

Merged, thanks!


-Olof
