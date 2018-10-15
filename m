Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f48.google.com ([209.85.167.48]:41229 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbeJOSlG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 14:41:06 -0400
Received: by mail-lf1-f48.google.com with SMTP id q39-v6so13722367lfi.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Oct 2018 03:56:21 -0700 (PDT)
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Hook up r8a77990 DT matching code
To: Simon Horman <horms+renesas@verge.net.au>,
        Alex Williamson <alex.williamson@redhat.com>,
        Joerg Roedel <joro@8bytes.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Hai Nguyen Pham <hai.pham.ud@renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20181015095557.25135-1-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c90c9a8b-d101-280f-7ee6-67e6cc473e64@cogentembedded.com>
Date: Mon, 15 Oct 2018 13:56:18 +0300
MIME-Version: 1.0
In-Reply-To: <20181015095557.25135-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/15/2018 12:55 PM, Simon Horman wrote:

> From: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> 
> Support the r8a77990 IPMMU and update IPMMU_OF_DECLARE to hook up

   That macro is gone, you need to update the description.

> the updated compat string.
> 
> Signed-off-by: Hai Nguyen Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> [simon: rebased; dropped no longer required IOMMU_OF_DECLARE hunk]

   Yet you didn't drop it from the description. :-)

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
