Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:39599 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755053AbdDRKZ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 06:25:59 -0400
Subject: Re: [PATCH 3/3] usb: host: xhci-plat: set resume_quirk() for R-Car
 controllers
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org
References: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1489744955-29553-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <58F5EA3C.8020100@linux.intel.com>
Date: Tue, 18 Apr 2017 13:28:12 +0300
MIME-Version: 1.0
In-Reply-To: <1489744955-29553-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 17.03.2017 12:02, Yoshihiro Shimoda wrote:
> This patch sets resume_quirk() for R-Car controllers to re-download
> the firmware in resume timing. Otherwise, if the controller's power
> is down in suspend timing, the firmware in the controller goes away,
> and then the controller doesn't work after resume.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---

Added to queue for usb next

-Mathias
