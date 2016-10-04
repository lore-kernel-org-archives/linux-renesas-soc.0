Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36428 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751125AbcJDRgr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 13:36:47 -0400
Received: by mail-lf0-f51.google.com with SMTP id b75so58671389lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Oct 2016 10:36:46 -0700 (PDT)
Subject: Re: [PATCH v2] pcie-rcar: try setting PCIe speed to 5 GT/s at boot
To: Bjorn Helgaas <helgaas@kernel.org>
References: <3386780.3qrqUfW7i7@wasted.cogentembedded.com>
 <20161004171322.GA3449@localhost>
Cc: horms@verge.net.au, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d45069af-cd92-faf3-6dbe-dac85419ca4d@cogentembedded.com>
Date: Tue, 4 Oct 2016 20:36:41 +0300
MIME-Version: 1.0
In-Reply-To: <20161004171322.GA3449@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/04/2016 08:13 PM, Bjorn Helgaas wrote:

>> Initially, the PCIe link speed is set up only  at 2.5 GT/s.
>> For better performance,  we're trying to increase link speed to 5 GT/s.
>>
>> Based on the original patch by Grigory Kletsko
>> <grigory.kletsko@cogentembedded.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> I addressed Simon's comment for you, added his ack, and applied this to
> pci/host-rcar for v4.9.

    Thank you!

MBR, Sergei
