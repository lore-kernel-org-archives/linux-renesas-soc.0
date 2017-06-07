Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33779 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751435AbdFGQRB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jun 2017 12:17:01 -0400
Received: by mail-lf0-f48.google.com with SMTP id a136so7845271lfa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jun 2017 09:17:01 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
To: Simon Horman <horms@verge.net.au>
References: <20170420185132.258111787@cogentembedded.com>
 <20170424061217.GC14843@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4937ae78-8800-1a11-547b-2269d063d45a@cogentembedded.com>
Date: Wed, 7 Jun 2017 19:16:52 +0300
MIME-Version: 1.0
In-Reply-To: <20170424061217.GC14843@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/24/2017 09:12 AM, Simon Horman wrote:

>>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
>> 'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC node
>> and then describing the pins for SCIF0 and Ether devices declared earlier.
>> These patches depend on the R8A7743 PFC suport in order to work properly.
>
> Thanks. I have marked these as deferred pending acceptance of the PFC
> driver changes. Please repost or otherwise let me know when dependency
> is satisfied.

    FYI, Linus W. has pulled the R8A774x PFC patches for 4.13:

https://www.spinics.net/lists/linux-renesas-soc/msg14824.html

MBR, Sergei
