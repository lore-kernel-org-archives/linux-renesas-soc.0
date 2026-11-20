Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205072;
	b=lwNDQgEGHZo+MDeInjz7Wk5cZZQZhe63JRyap7rzl4wHRgpTh3I0/bWqXihYM0V5UcW9
	 t9ftaE01fi+v4gsaG+yVbNg5Dg2oTvMiu5pCL/Xw43PfGfOl05Juch1BLuczdXr3VRgsP
	 CNJpVygJmZ1XxvlDXB/5+TldV8eYIBegeYe9ZCduwf1kCApY7Rbx42YFW1r3sMKx2ZJd7
	 GJ90tbx84rsX7HPc8KG2+gCKwfvkbpGjc2MTD0C6SPg4j357SV2+8NE92qwBz409UJu4l
	 2larRG5rIvthACVw6DHjgjohIcSj6Dulk3ubdG8kUVBxrikz/nPmQ/M/rdsATR55lZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205072;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DTPZmS/bPYDmH5Anx7Jvfyqcbc1hHGRWNW4JSBUYubU=;
	b=m/g4TwuPUPzxRQq/1buLXx/89P+kjPAB7t9RTNh+RXMomMrUs0U6vuqVOTNdMZUNSs2p
	 7p45oqKQ0ImSyeHvDGyI+gZa8HYmtBgLy1Ss7qHCeRbEvXBvbBxXjixSTtNVtpBeiu3mv
	 zLZ5odnV60Pt0MMIdeXyboZnoSvcOh7fwqLIAT5KctFFUNjNroCyDU/DXNMWS9vkqwg3c
	 GEI9cWiY96C+4YtC9CeqfMNAT1+i69IyWJOpFrykcaxKZxy5au7wRTlnWo1ake+5HZGjt
	 77zG4wZTAZ03i4qWLC6iixnZslLE1T/u8UC6FEIClYIk/ptnWFOrmKQQvM4NtKcP/yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xEBdltaA;
	arc=none smtp.remote-ip=95.215.58.133
Received: from mta1.migadu.com (out-133.mta1.migadu.com [95.215.58.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D13C606A6DF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 20:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D13C606A6DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xEBdltaA
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5r9H/pB0QEAQGYTbE3jhgHps7RpjUGgAGmiNOnnASh4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795205069; v=1; x=1795809869;
 b=xEBdltaAJxn+uZNdQPmBHMUXp6XV3A2z1I36RxzDw7/KL2eD9D5bmeW2bV4Am0mv2c6Xun2T
 s8x0dsgPVeNm7HZmx9r9ermtSssW8ECCqTQ0N/hFbjdABaN6+F1K0UXpW8MXkTLBf8oSVjpSEg5
 hvWjJOCkAhVRP3OKV/SJxtJ4=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 79d02deefa817cdc;
	Fri, 20 Nov 2026 20:04:29 +0000
X-Mizu-Trace-ID: 79d02deefa817cdc
X-Migadu-Flow: FLOW_OUT
Message-ID: <3b26635a-4ab4-450f-8626-e4737d16be12@linux.dev>
Date: Fri, 20 Nov 2026 21:04:24 +0100
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 20/24] net: dsa: rzn1-a5psw: Get lookup table
 size from OF data
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-21-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <99974c5f-c1c0-427c-ab10-a6559789f258@linux.dev>
 <CA+V-a8vikSkbxjoE+Wq+jZ1uQjtbu2VFttHEMGXHkWqqcqf6Lg@mail.gmail.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <CA+V-a8vikSkbxjoE+Wq+jZ1uQjtbu2VFttHEMGXHkWqqcqf6Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 19:34, Lad, Prabhakar wrote:
> Hi Clement,
> 
> Thank you for the review.
> 
> On Fri, Nov 20, 2026 at 9:44 AM Clement Leger <clement.leger@linux.dev> wrote:
>>
>>
>>
>> On 11/20/26 01:25, Prabhakar wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> The RZ/N1 A5PSW has 8192 lookup table entries, whereas the RZ/T2H
>>> and RZ/N2H ETHSW have only 4096 entries.
>>>
>>> Add the lookup table size to struct a5psw_of_data, derive the address
>>> mask from it and use it in the FDB and ageing code.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> v4->v5:
>>> - New patch
>>> ---
>>>    drivers/net/dsa/rzn1_a5psw.c | 10 ++++++----
>>>    drivers/net/dsa/rzn1_a5psw.h |  4 ++--
>>>    2 files changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
>>> index 7e9bc252d92a..c0c1f45852da 100644
>>> --- a/drivers/net/dsa/rzn1_a5psw.c
>>> +++ b/drivers/net/dsa/rzn1_a5psw.c
>>> @@ -311,18 +311,19 @@ static void a5psw_phylink_mac_link_up(struct phylink_config *config,
>>>    static int a5psw_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
>>>    {
>>>        struct a5psw *a5psw = ds->priv;
>>> +     unsigned int entries = a5psw->of_data->lk_table_entries;
>>>        unsigned long rate;
>>>        u64 max, tmp;
>>>        u32 agetime;
>>>
>>>        rate = clk_get_rate(a5psw->clk);
>>> -     max = div64_ul(((u64)A5PSW_LK_AGETIME_MASK * A5PSW_TABLE_ENTRIES * 1024),
>>> +     max = div64_ul(((u64)A5PSW_LK_AGETIME_MASK * entries * 1024),
>>>                       rate) * 1000;
>>>        if (msecs > max)
>>>                return -EINVAL;
>>>
>>>        tmp = div_u64(rate, MSEC_PER_SEC);
>>> -     agetime = div_u64(msecs * tmp, 1024 * A5PSW_TABLE_ENTRIES);
>>> +     agetime = div_u64(msecs * tmp, 1024 * entries);
>>>
>>>        a5psw_reg_writel(a5psw, A5PSW_LK_AGETIME, agetime);
>>>
>>> @@ -511,7 +512,7 @@ static int a5psw_lk_execute_lookup(struct a5psw *a5psw, union lk_data *lk_data,
>>>        if (ret)
>>>                return ret;
>>>
>>> -     *entry = ctrl & A5PSW_LK_ADDR_CTRL_ADDRESS;
>>> +     *entry = ctrl & (a5psw->of_data->lk_table_entries - 1);
>>>
>>>        return 0;
>>>    }
>>> @@ -638,7 +639,7 @@ static int a5psw_port_fdb_dump(struct dsa_switch *ds, int port,
>>>
>>>        mutex_lock(&a5psw->lk_lock);
>>>
>>> -     for (i = 0; i < A5PSW_TABLE_ENTRIES; i++) {
>>> +     for (i = 0; i < a5psw->of_data->lk_table_entries; i++) {
>>>                reg = A5PSW_LK_ADDR_CTRL_READ | A5PSW_LK_ADDR_CTRL_WAIT | i;
>>>
>>>                ret = a5psw_lk_execute_ctrl(a5psw, &reg);
>>> @@ -1357,6 +1358,7 @@ static const struct a5psw_of_data rzn1_of_data = {
>>>        .pattern_ctrl_base = 0x3eb0,
>>>        .vlan_res_vlanid = GENMASK(16, 5),
>>>        .vlan_res_portmask = GENMASK(4, 0),
>>> +     .lk_table_entries = 8192,
>>>    };
>>>
>>>    static const struct of_device_id a5psw_of_mtable[] = {
>>> diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
>>> index 29d205e2331d..fd523fe7bf47 100644
>>> --- a/drivers/net/dsa/rzn1_a5psw.h
>>> +++ b/drivers/net/dsa/rzn1_a5psw.h
>>> @@ -93,7 +93,6 @@
>>>    #define A5PSW_LK_ADDR_CTRL_WAIT             BIT(27)
>>>    #define A5PSW_LK_ADDR_CTRL_READ             BIT(26)
>>>    #define A5PSW_LK_ADDR_CTRL_WRITE    BIT(25)
>>> -#define A5PSW_LK_ADDR_CTRL_ADDRESS   GENMASK(12, 0)
>>>
>>>    #define A5PSW_LK_DATA_LO            0x40C
>>>    #define A5PSW_LK_DATA_HI            0x410
>>> @@ -210,7 +209,6 @@
>>>
>>>    #define A5PSW_LK_BUSY_USEC_POLL             10
>>>    #define A5PSW_CTRL_TIMEOUT          1000
>>> -#define A5PSW_TABLE_ENTRIES          8192
>>>
>>>    struct fdb_entry {
>>>        u8 mac[ETH_ALEN];
>>> @@ -241,6 +239,7 @@ union lk_data {
>>>     * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
>>>     * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
>>>     * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
>>> + * @lk_table_entries: Number of entries in the lookup table (power of 2)
>>>     */
>>>    struct a5psw_of_data {
>>>        unsigned int nports;
>>> @@ -252,6 +251,7 @@ struct a5psw_of_data {
>>>        u16 pattern_ctrl_base;
>>>        u32 vlan_res_vlanid;
>>>        u32 vlan_res_portmask;
>>> +     unsigned int lk_table_entries;
>>>    };
>>>
>>>    /**
>>
>> Hi Prabhakar,
>>
>> It would probably be better to fold all these commits that adds data
>> into bits of data in oa5psw_of_data into two commits: a first one that
>> prepares support for RZ/N2 and then a second one that add RZ/N2 support
>> itself. I'm not the net maintainer but your series is already quite
>> large just for this change so folding the commits make sense rather than
>> commitmaxxing.
>>
> My intention here was to keep changes minimal so that it's easier to
> review. Since the fixes patches will go as a separate series, I would
> like to keep this as is. Hope thats OK.

Yes sure, I mean if it fits under the 15 patches limit, that is 
certainly fine :)

Thanks,

Clément

> 
> Cheers,
> Prabhakar

