Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42776 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751705AbeBEJ4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 04:56:14 -0500
Date: Mon, 5 Feb 2018 10:56:08 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 03/11] dt-bindings: power: add R8A77980 SYSC power domain
 definitions
Message-ID: <20180205095608.3tj2ewr2uzicennn@verge.net.au>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <5177bec1-422f-688d-ea67-f15951505b1e@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5177bec1-422f-688d-ea67-f15951505b1e@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 02, 2018 at 09:29:16PM +0300, Sergei Shtylyov wrote:
> Add macros usable by the device tree sources to reference R8A77980 SYSC
> power domains by index.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
