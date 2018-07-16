Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39695 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbeGPTTj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 15:19:39 -0400
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so10716666lji.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jul 2018 11:50:56 -0700 (PDT)
Subject: Re: [PATCH 0/8] Fix PCI I/O space page leaks
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Joao Pinto <Joao.Pinto@synopsys.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Rob Herring <robh@kernel.org>,
        Tanmay Inamdar <tinamdar@apm.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <3e862a05-084a-d732-3060-6e2b234e9718@cogentembedded.com>
 <20180716150606.GA19945@red-moon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <db85a353-2d90-2aa5-2f45-13d8a0b36424@cogentembedded.com>
Date: Mon, 16 Jul 2018 21:50:52 +0300
MIME-Version: 1.0
In-Reply-To: <20180716150606.GA19945@red-moon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/16/2018 06:06 PM, Lorenzo Pieralisi wrote:

>> Here's a set of 8 patches against the 'pci/controller-fixes' branch of Lorenzo
>> Pieralisi's 'pci.git' repo. They are the fixes for the PCI I/O space page leaks
>> (and the kernel BUG caused by them on deferred probe); those were 1st found
>> testing the R-Car PCIe driver. The patches are in the chronological order
>> (considering the date/time of the commits specified in the Fixes: tag), patches
>> #2..#8 depend on the patch #1 in order to build/work as it introduces the managed
>> device API that they all use...
>>
>> [1/8] PCI: xgene: Fix I/O space page leak
>> [2/8] PCI: of: Fix I/O space page leak
>> [3/8] PCI: versatile: Fix I/O space page leak
>> [4/8] PCI: designware: Fix I/O space page leak
>> [5/8] PCI: aardvark: Fix I/O space page leak
>> [6/8] PCI: faraday: Fix I/O space page leak
>> [7/8] PCI: mediatek: Fix I/O space page leak
>> [8/8] PCI: v3-semi: Fix I/O space page leak
>>
>> MBR, Sergei
> 
> Hi Sergei,
> 
> I reshuffled the series, rewrote commit logs and move the devm_
> API to commit 2 which is the one you tested AFAIK.

   Well, that means the XGene fix wouldn't propagate "deep enough", if that's your
choice, OK...

> I pushed them out to my pci/controller-fixes branch which I hope
> we can still aim for an -rc, please do have a look and let me know
> what you think, I have not asked Bjorn to pull it yet.

   Your edits generally look fine, except you forgot the usual "X has the same issue"
phrase in the XGene's commit log.

> Thanks,
> Lorenzo

MBR, Sergei
