Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35749 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753010AbcFANe7 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 09:34:59 -0400
Received: by mail-lf0-f49.google.com with SMTP id w16so12986241lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jun 2016 06:34:58 -0700 (PDT)
Subject: Re: [PATCH 11/13] DT: arm: shmobile: document Blanche board
To: Simon Horman <horms@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <52321184.HGKDRaDOBe@wasted.cogentembedded.com>
 <20160531235119.GA20527@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <757fa28c-00d0-f17b-e335-658a0b993791@cogentembedded.com>
Date: Wed, 1 Jun 2016 16:34:54 +0300
MIME-Version: 1.0
In-Reply-To: <20160531235119.GA20527@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 06/01/2016 02:51 AM, Simon Horman wrote:

>> Document the Blanche device tree bindings, listing it as a supported board.
>>
>> This allows to use checkpatch.pl to validate .dts files referring to the
>> Blanche board.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> I think the prefix for patch 11 should be: "ARM: dts: blanche: "

     Hm... why?

> It also looks like it could be squashed into patch 12 but I don't
> feel strongly about that.

    I'd prefer not to merge them.

[...]

MBR, Sergei
