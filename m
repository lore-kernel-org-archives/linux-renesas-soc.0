Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000BCC43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 11:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4312208C3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556279695;
	bh=eoQ7l9KNmIM+FnDjz6dXIbRHBpA6734LVlbHJtYUmKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=s+aHIy0tMwmCLFzDyNwg+vzNNi26f8o2Dd2MOmfF554JS5OaYDezcISQMQnR6b5rc
	 6iXrEt3oKADUA1gPTkrTXD5tYPufmVYcUYp/NHz2QoZLZEM4Dn2cm1bn70sf5nNv5W
	 VTB9rygHLOag0gEfGlmXTRK/pxLqlFVFwb6WA5s4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfDZLyz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 07:54:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:46674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfDZLyz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 07:54:55 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24896206C1;
        Fri, 26 Apr 2019 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556279694;
        bh=eoQ7l9KNmIM+FnDjz6dXIbRHBpA6734LVlbHJtYUmKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ATPJTwp/mrihRh+67xd+x5sL9LKrNmsKPXf/D6NInwXYoG55Tvf5d+US3AUL2t7V0
         DHf3G1kzPxWXeY4ig+IyPEfAekyna8ZV2z6jdc1lWZx801jEUCFVEGxmqrglRtPxTO
         ks3NFN5K07+DfoGv2D/xlBtMJoEEI3nLMZpDz/yQ=
Date:   Fri, 26 Apr 2019 17:24:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Update copyright information
Message-ID: <20190426115447.GZ28103@vkoul-mobl>
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10-04-19, 20:26, Niklas Söderlund wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> 
> Update copyright and string for Gen3.

Applied, thanks

-- 
~Vinod
