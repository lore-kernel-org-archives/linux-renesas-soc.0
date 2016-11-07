Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:24665 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751130AbcKGARz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Nov 2016 19:17:55 -0500
Message-ID: <581FC82E.5050202@jinso.co.jp>
Date: Mon, 07 Nov 2016 09:17:50 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
CC: geert+renesas@glider.be, linux-spi@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        ryusuke.sakato.bx@renesas.com, linux-renesas-soc@vger.kernel.org,
        nv-dung@jinso.co.jp, h-inayoshi@jinso.co.jp
Subject: Re: [PATCH 0/1] ARM: spi supports 32bytes buffer for DUAL and QUAD
References: <1478248734-32044-1-git-send-email-cm-hiep@jinso.co.jp> <20161104154930.6fepg25wma2l2gz2@sirena.org.uk>
In-Reply-To: <20161104154930.6fepg25wma2l2gz2@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark


On 11/05/2016 12:49 AM, Mark Brown wrote:
> On Fri, Nov 04, 2016 at 05:38:53PM +0900, Cao Minh Hiep wrote:
>> From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
>>
>> Hi,
>>
>> This patch will improve the DUAL and QUAD's performance of SPI,
>> that supported for GEN2 r8a7790 SOC in PIO mode.
>> It sends/receives each 32bytes of data instead of each byte data
>> as current situation.
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.
Thanks, I will do it next time.

Best regards,
Jinzai solution Inc.
Hiep.
