Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33658 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932364AbcFGLAC (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 07:00:02 -0400
Received: by mail-lf0-f53.google.com with SMTP id s64so112574970lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2016 04:00:01 -0700 (PDT)
Subject: Re: [PATCH 2/3] iommu/ipmmu-vmsa: Increase maximum micro-TLBS to 48
To: Magnus Damm <magnus.damm@gmail.com>,
	iommu@lists.linux-foundation.org
References: <20160607033918.28687.98260.sendpatchset@little-apple>
 <20160607033936.28687.78365.sendpatchset@little-apple>
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d09728bb-2a46-e050-3525-757858c17295@cogentembedded.com>
Date: Tue, 7 Jun 2016 13:59:56 +0300
MIME-Version: 1.0
In-Reply-To: <20160607033936.28687.78365.sendpatchset@little-apple>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 6/7/2016 6:39 AM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
>
> Bump up the maximum numbers of micro-TLBS to 48.
>
> Each IPMMU device instance get micro-TLB assignment via
> the "iommus" property in DT. Older SoCs tend to use a
> maximum number of 32 micro-TLBd per IPMMU instance however

    Micro-TLBs?

> newer SoCs such as r8a7796 make use of up to 48 micro-TLBs.
>
> At this point no SoC specific handling is done to validate
> the maximum number of micro-TLBs, and because of that the
> DT information is assumed to be within correct range for
> each particular SoC.
>
> If needed in the future SoC specific feature flags can be
> added to handle the maximum number of micro-TLBs without
> requiring DT changes, however at this point this does not
> seem necessary.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
[...]

MBR, Sergei
