Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:58618 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753312AbdC2Fwc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 01:52:32 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc\@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] usb: gadget: udc: renesas_usb3: add sysfs "role" to set "b-device" mode
In-Reply-To: <PS1PR06MB1692F6A720410D53A6972379D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1490702004-8167-2-git-send-email-yoshihiro.shimoda.uh@renesas.com> <87efxhhahj.fsf@linux.intel.com> <PS1PR06MB1692F6A720410D53A6972379D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
Date: Wed, 29 Mar 2017 08:52:12 +0300
Message-ID: <87d1d0fx4j.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



Hi,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> Hi Felipe-san,
>
>> From: Felipe Balbi, Sent: Tuesday, March 28, 2017 9:06 PM
>> 
>> Hi,
>> 
>> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>> > Sadly, to change the role ("host" and "peripheral") of USB3.0 DRD
>> > controller on R-Car Gen3, software has to set the DRD_CON register
>> > which is included in a usb3.0 peripheral controler's register.
>> > To simply implementation, the previous code always set peripheral mode
>> > as hardcoded. However, to support usb role swap in the future,
>> > the hardcoded is not good. So, this patch adds sysfs "role" to set
>> > the mode by a user.
>> > After applied this patch, since the DRD controller will act as host
>> > mode after probed, a user needs to change the mode via the sysfs.
>> >
>> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> 
>> in patch 3, you add extcon to monitor ID and VBUS pins. Do you really
>> need this sysfs file at all?
>
> Yes. This is because this "role" sysfs file cannot monitor the ID and VBUS pins.
> The "role" only monitors the mode which is "host" or "peripheral".

Right, I understand it can't monitor the state of ID/VBUS, but do you
have a usecase for that file that's not covered by the other patches in
the series? :-)

If you want to force renesas controller to peripheral mode, then
shouldn't you use dr-mode device_property() instead?

-- 
balbi
