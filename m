Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242A6C5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 16:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE5902084E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 16:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="Ky0dS2ep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE5902084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbeLKQMd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 11:12:33 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42918 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbeLKQMa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 11:12:30 -0500
Received: by mail-lf1-f68.google.com with SMTP id l10so11186705lfh.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 08:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=46fwj8YcReytyr8AzNJalj0w3E7iTBrGitUtFeTjOPE=;
        b=Ky0dS2eppraBn2KnpC1qjPAh/AjlhYGQLxxeTYeneUGny5x9lZXhrwS4A/fkg/rt98
         Rlb9wRkB71JB40Fo+mNE49f2g/I6TSgnptNM+ajWyeapn4JHGJ8GrxCLW+3kdlqNpIfJ
         mNhQ3iVTgvqPe3EPJlGX8MhKMtMxb3bCAsomMGSWl/1fByFbgHhU7DCH0XBm3MejCT0k
         evuimCJU+Mi3W1UsCY2Ph6EiiOJjfuxcsQElBf/JvZSETouFvxIbW6dpZlSTPPJml3Ga
         AEwhb7cAPWF8c4s9xYTA8dtuECwtHODeQKTOohTgXMP3WPhrfkT243H/mJ3vswDWL26V
         11wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=46fwj8YcReytyr8AzNJalj0w3E7iTBrGitUtFeTjOPE=;
        b=BkTuqepNzF58HWmXXAu/0RZRmHj978C0af5MIvsnbV+AA+nnvbZOKtvGPhPzqP2e5L
         h4sKJbLdvfKtZzNJPRDaaaG8SFgWyABnd+416nCXkk2dNTysFbuGIQD7yCn6+W2Vcbiv
         YsHB/nryZoQ0Qg0fiKTqnoMIhfu4YS7aYDf4+H9mwEMdm4xmA5EurPJ65WTaYFAxKa0d
         Wio4aohIWm0VxYtBAFKfa7nCD+SF84oXRf0MH/ocV/RbBRsICwm6HG+1ON+/nEKEJ/UC
         Y57amh2JGapvjQ76YnRL9Og8As3JX61+Uq3COImJvBFbACDBh5mNKEOJC+1bHXEH/M+4
         J4JQ==
X-Gm-Message-State: AA+aEWYOdBb8YqLvyj3cuQzYhUQpjn5HpkVn59PcBsMT/Gs3MKQJMvlM
        L5I+R5MLcHvG7ghZHYf9292IpA==
X-Google-Smtp-Source: AFSGD/UgLMwKeoI+dl+LQVnzZ6eERlBXMBNc0a0heIbI8e5mFeq7mPyxDmmCYjO4afhdcvUs62pnNg==
X-Received: by 2002:a19:200b:: with SMTP id g11mr9348983lfg.58.1544544748652;
        Tue, 11 Dec 2018 08:12:28 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id k21-v6sm2748410ljc.15.2018.12.11.08.12.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Dec 2018 08:12:27 -0800 (PST)
Date:   Tue, 11 Dec 2018 08:04:46 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.21
Message-ID: <20181211160446.oby2mmxv22wkwcva@localhost>
References: <cover.1544124873.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1544124873.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 06, 2018 at 01:59:10PM -0800, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT bindings updates for v4.21.
> 
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.21
> 
> for you to fetch changes up to 74791d15fd7c405511e3cc097c2f043171ecbdb0:
> 
>   dt-bindings: arm: renesas: Move 'renesas,prr' binding to its own doc (2018-12-06 11:33:22 -0800)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Bindings Updates for v4.21
> 
> * Move 'renesas,prr' binding to its own document
>   - Prepration for converting board-level bindings to json-schema
> 
> * Document iW-RainboW-G20D-Qseven-RZG1N board and iWave RZ/G1N SOM

Merged into next/dt. thanks!


-Olof
