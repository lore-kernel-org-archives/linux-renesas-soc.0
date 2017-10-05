Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:46003 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751415AbdJEKIN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 06:08:13 -0400
Subject: Re: [PATCH] usb: host: xhci-plat: Use of_device_get_match_data()
 helper
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <1507119903-13148-1-git-send-email-geert+renesas@glider.be>
 <20171005091916.GR26369@verge.net.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Mathias Nyman <mathias.nyman@intel.com>
Message-ID: <59D60571.40101@intel.com>
Date: Thu, 5 Oct 2017 13:12:01 +0300
MIME-Version: 1.0
In-Reply-To: <20171005091916.GR26369@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05.10.2017 12:19, Simon Horman wrote:
> On Wed, Oct 04, 2017 at 02:25:03PM +0200, Geert Uytterhoeven wrote:
>> Use the of_device_get_match_data() helper instead of open coding.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
>

Thanks, I already applied and sent forward before this new reviewed-by tag

-Mathias
