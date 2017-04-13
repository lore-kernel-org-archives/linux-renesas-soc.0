Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:56471 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750745AbdDMINm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Apr 2017 04:13:42 -0400
Subject: Re: [PATCH 0/3] usb: host: xhci-plat: add support suspend/resume for
 R-Car
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <PS1PR06MB1692F1F7FCB02AC52E227FFCD8030@PS1PR06MB1692.apcprd06.prod.outlook.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <58EF33B8.4030003@linux.intel.com>
Date: Thu, 13 Apr 2017 11:15:52 +0300
MIME-Version: 1.0
In-Reply-To: <PS1PR06MB1692F1F7FCB02AC52E227FFCD8030@PS1PR06MB1692.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12.04.2017 03:46, Yoshihiro Shimoda wrote:
> Hi Mathias,
>
>> From: Yoshihiro Shimoda, Sent: Friday, March 17, 2017 7:03 PM
>>
>> This patch adds support suspend/resume for R-Car controllers.
>> The controllers need firmware downloading and the current code has
>> such process only when probe timing. After suspend the system and
>> the power of controller down, the driver needs to re-download the firmware
>> in resume timing. This patch adds such a process.
>> Also, since previous xhci-plat code didnn't handle the clk in suspend/resume,
>> this patch set has such process.
>
> I'm afraid but would you review this patch set?
> This can be applied on the latest Greg's usb.git / usb-next branch at the moment.
>

Sorry about the delay, I'll start looking at these.

-Mathias
