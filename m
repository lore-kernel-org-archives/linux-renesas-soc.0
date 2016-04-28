Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41877 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752346AbcD1XfA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 19:35:00 -0400
Date: Fri, 29 Apr 2016 09:34:57 +1000
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] ravb: Remove rx buffer ALIGN
Message-ID: <20160428233456.GC18128@verge.net.au>
References: <1461514567-23444-1-git-send-email-ykaneko0929@gmail.com>
 <571FBE21.4050908@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571FBE21.4050908@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei, Hi Kaneko-san,

On Tue, Apr 26, 2016 at 10:14:41PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 04/24/2016 07:16 PM, Yoshihiro Kaneko wrote:
> 
> >From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> >
> >Aligning the reception data size is not required.
> 
>    OK, the gen 2/3 manuals indeed don't require this. I assume the patch has
> been tested...

This morning I tested this patch applied on net-next using the
r8a7795/salvator-x  (Gen-3). My test was to boot to a user-space prompt
using NFS root which was successful. I can run further tests on this setup
if it would be useful.

Unfortunately I do not have access to hardware to allow me to test this
on Gen-2.

> >Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> >Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Tested-by: Simon Horman <horms+renesas@verge.net.au>

>    I have a few comments though...

[...]
