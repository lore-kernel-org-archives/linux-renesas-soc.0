Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36933 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbeHURlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 13:41:46 -0400
Date: Tue, 21 Aug 2018 15:21:45 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi_internal_dmac: fix typo in
 DM_CM_DTRAN_MODE.BUS_WIDTH field name
Message-ID: <20180821132141.auv76qlhrkhjhgxf@verge.net.au>
References: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
 <f93ace85-6e2a-fec0-b73c-9101bdde60eb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f93ace85-6e2a-fec0-b73c-9101bdde60eb@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 17, 2018 at 11:19:02PM +0300, Sergei Shtylyov wrote:
> Fix a stray underscore in the DM_CM_DTRAN_MODE.BUS_WIDTH register field
> name.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
