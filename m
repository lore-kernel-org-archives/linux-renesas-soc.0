Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46364 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbeKFVAO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 16:00:14 -0500
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and
 functions
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
 <20181106111448.5rc3yzfdzuv7w562@ninjato>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <76819f63-39fa-3371-9551-fd76faf8baf2@gmail.com>
Date: Tue, 6 Nov 2018 12:35:25 +0100
MIME-Version: 1.0
In-Reply-To: <20181106111448.5rc3yzfdzuv7w562@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/06/2018 12:14 PM, Wolfram Sang wrote:
> 
>>  static const struct {
>> -	struct sh_pfc_pin_group common[123];
>> +	struct sh_pfc_pin_group common[140];
>>  	struct sh_pfc_pin_group automotive[0];
>>  } pinmux_groups = {
> 
> ...
> 
>>  static const struct {
>> -	struct sh_pfc_function common[29];
>> +	struct sh_pfc_function common[32];
>>  	struct sh_pfc_function automotive[0];
>>  } pinmux_functions = {
> 
> 
> It is Geert's call, but maybe those are a seperate patch?

These must be part of this patch, since adding
+		SH_PFC_PIN_GROUP(sdhi0_data1),
entries grows the size of the array. If you were to split this patch,
the PFC driver would break, as the size of the array won't match the
size of the content.

-- 
Best regards,
Marek Vasut
