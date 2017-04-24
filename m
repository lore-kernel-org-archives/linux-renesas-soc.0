Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38112 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1046473AbdDXGMY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 02:12:24 -0400
Date: Mon, 24 Apr 2017 08:12:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
Message-ID: <20170424061217.GC14843@verge.net.au>
References: <20170420185132.258111787@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170420185132.258111787@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 20, 2017 at 09:51:32PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC node
> and then describing the pins for SCIF0 and Ether devices declared earlier.
> These patches depend on the R8A7743 PFC suport in order to work properly.

Thanks. I have marked these as deferred pending acceptance of the PFC
driver changes. Please repost or otherwise let me know when dependency
is satisfied.
