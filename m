Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E94C433FE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Nov 2022 07:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiKJH0c (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 02:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiKJH0b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 02:26:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4526831FBA;
        Wed,  9 Nov 2022 23:26:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D670661D9B;
        Thu, 10 Nov 2022 07:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C435C433D6;
        Thu, 10 Nov 2022 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668065190;
        bh=Us/sWFYywW6ZW57ATsUs5H4SZp3VJ/alueMxkWoq1vw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rYVfmz2LfuyfMRqGLwo4EJKPhWCOncvUDoKkb6lx/e+BomsaAm1HrWjsk7BCJVOz0
         nEplmpOJHW8NBOo5ULVkHcnWy7TR4cGhFkRPTcBkK8nGgKCXC9NkB1+XOSvhvKEQ/F
         SPcWoYkzbgMaG/KfiyBqXscAbVCeI3veY9yNt/Bh4MibA0+rkyJoIAaHsliDHIesGM
         q/ahpeoZs6o9kGfuHyWfuvGQMfDb7E9EAiA70nM44qt/TgL8Nu5dVzAcuRMG1Lbeba
         ki4SY8JUKUgHWiDeaofa9PzExi9siW+MpSfJWy4ydEakYe08UQ9w9O02jkad0Bv03B
         rt6IAdpZP9B7w==
Date:   Thu, 10 Nov 2022 12:56:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/2] phy: renesas: Add Renesas Ethernet SERDES driver
 for R-Car S4-8
Message-ID: <Y2ynoeZUu/9vWM8t@matsya>
References: <20221108005500.3011449-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108005500.3011449-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 08-11-22, 09:54, Yoshihiro Shimoda wrote:
> This patch series is based on next-20221104.
> Add support for R-Car S4-8 Etherent SERDES as a Generic PHY.

Applied, thanks

-- 
~Vinod
