Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36212 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752249AbcJCQpB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2016 12:45:01 -0400
Received: by mail-lf0-f52.google.com with SMTP id b75so29493960lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2016 09:45:01 -0700 (PDT)
Subject: Re: [PATCH v2] pcie-rcar: try setting PCIe speed to 5 GT/s at boot
To: bhelgaas@google.com
References: <3386780.3qrqUfW7i7@wasted.cogentembedded.com>
 <20160927121007.GA9498@verge.net.au>
Cc: Simon Horman <horms@verge.net.au>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <19b9b784-0cad-bc74-35bb-2ce4a736393e@cogentembedded.com>
Date: Mon, 3 Oct 2016 19:44:56 +0300
MIME-Version: 1.0
In-Reply-To: <20160927121007.GA9498@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/27/2016 03:10 PM, Simon Horman wrote:

>> Initially, the PCIe link speed is set up only  at 2.5 GT/s.
>> For better performance,  we're trying to increase link speed to 5 GT/s.
>>
>> Based on the original patch by Grigory Kletsko
>> <grigory.kletsko@cogentembedded.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> The patch is against the 'next' branch of Bjorn Helgaas' 'pci.git' repo.
>
> Minor comment below, that not withstanding.
>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>

    Bjorn, we expected this to be merged to 4.9-rc1, is that still possible?

MBR, Sergei
