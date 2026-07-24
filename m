Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4E41A923
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895785; cv=none; b=sW/sNujP2MMinzRjLtvLhd5LKas81tFZM3We4aXYsKhIW81rHHNPDg3r8uJr6as1E9NXscmOS/AW3x6qS5oiSkUYmlxw5/3suQroERuersfyrq+KDpn0EJOM94RqfXx/tsrPkuIXKKhc8cGPB400BQPb57l2MUa3a6ROUjhVDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895785; c=relaxed/simple;
	bh=eSJC/HPXN3YTKNn2Z8B6fMEKeWRVybcLVZH7mVe5aGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUEkO2GALxAfzCzdOf/tL63MNrciZF2ImgQeWfxrVXtjtk7Oqs4JmRpO5mjgqYaHLvM+6wZ41OnfIC0OSZMJAhXI17Tv/JZFhTml598Bnl6q+j8gwVay712MKxlZ9BzYhPTBg5bJvn8GHePcGxwREhFy/Zn0jlw88quEg7I5wvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOA7KUZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vg1eptdd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOA7KUZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vg1eptdd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADsUF2616247
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 12:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=; b=XOA7KUZy5pk6PVqE
	Nc4Ta5bdbp8FPw6UN6UBTUZItLw0RamLPAjQLYfYFfU9f4lXXakwv4L3C6ubnPOE
	Gz5PjVhI9ZSKdTodG0gQkr0fDrFr/UK5ZBn8MXpnOy6s6PRAIyL8KyAxQoxlhNjC
	65a6mUyMdFY2D/Gn7SB8VIkqPnvGrHPSa/fOrND6nJ/1OZSPfaIMhflF7kMKN0vU
	dPfPcFOnlYFndTitzlIk70aHKkSOF90ZQOiq0UckkepiYDHd+pskcC+vHhDdNrt2
	iCdJR8NASVXn3e63hqKiGF1WTyrfKhFja8u5FDEKyNzcV9FOFwuwvu942F6C4Zgy
	SlLV6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9qh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 12:23:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so701421cf.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jul 2026 05:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784895782; x=1785500582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=;
        b=Vg1eptdd5ZDZDo9lMWaUim9m86/XWDNiq7gEh+zU6XMNI4RHQhYZmiSfZ3c+v1LykQ
         4IzLy6SoGcviKq2R+vHryPdXhOPaM3kNo4aUBn8/vQVKjC3kJHYyPm4XiJeEZ6FoFhq2
         n11umC90C//UdQMyF0EM+KXG1CHNrYJXttadXrAbgE/Lvep2DCp0FCpptnND31oZ6LKp
         XWSgRvFjByi6mjeb/sgXt/6vKVdLFukeUddXyw1rvaBwhFpuPbtlKV5LY/RJyhZCkl/0
         aAUNLyP2xkNjNDlimVe/POVlGvovv/c7kKacUtoQdwdkUTgXf+8D7Si6o4OhnIL6mrMF
         C6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895782; x=1785500582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=;
        b=EAj3QCFTBkCCjWqzNrVLlCQgoLRd7w8b25csspB2im33kz8omCEKjhDYJo4bMjODIZ
         0/Q6wWiJryNJ2UxmxSmBK9fDuog50ElMUahioOPLeeON0i1scYjhD1dIRR3DyixTx8Ad
         Z0yulxDLNJMJXPM6rEvSnQ3YybuGrHs796DI/o/f7AUxXmawyTm4npZEDfr2ndw0WWkX
         7wWLgSWyb2qbeurbpAEK5LRgW2fWqRVdJNhBRd0EddpB8fK2Ocm56KVDdwdr6gkID4ak
         0d43AdbLzBZDzCEqaJ1cXKPqHa8qNpDb/L/q4PFyHxSrMzgFmLXWLgIb1QZ277Kcf7T5
         a6+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rprq0VBjFT0b7wWXkkCWDvvfd2XuDYt/EhEF9CbiplhG7z2HPJedhDnzydCFx8nI5vPTf6D74je+4GwqAVybANMLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydiVxXv9G40DJlIvm7Ua7vQRDS7G0ro92H+yqjPWonW5w1me5J
	GdRsq9UxxkH6sfWbt/fwz+t6DDSSu84CM4hLkFLeUXEd2TxE3idXmhoy7GOsHrL4QvY/W0N8uND
	YkGRqy39C90omPnUhDS5bGSNicX8zwEuFjzi5Oz7nnyPb5t23H8FLWQpDkBdkVO45M/6PVK2PKQ
	==
X-Gm-Gg: AR+sD13ti8mFgAYdbNZIgUcXTaHFsEdx/0S4A/zUB6+dNaKcVNXcDv1xLuWBATJmWlb
	H73nHuhKD+nLiy3tkrLWmzhEuIKsWgsHyAIguHaLdzxLPUCACDSB3Oy0QyPs2DTZGNKkOtDrNjg
	8nU0xeF+b+/UORfH0s1Q4TjdNtRM70/FiWHuhPa8g00HXB1X0BZ19c7G40zsW7GaAdj9Gyzd9Qq
	s2zEChVf56aNuAw7j5WZYsV0Fec+jDUsSlhUO56q9/dsYmqpNOAgzVPtJv2rbihCq+J5LFcuDYT
	PHAlrczUiWL0k7MbLRzsXomOutlmcyjGHOMbPSs8glfRkDU+AVszsX7bmRWD3wvYtcvjtbjQE81
	nCGeEPEsNqSndhgB0g6g+2SeK
X-Received: by 2002:a05:622a:6208:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-528496c5744mr31381011cf.3.1784895782012;
        Fri, 24 Jul 2026 05:23:02 -0700 (PDT)
X-Received: by 2002:a05:622a:6208:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-528496c5744mr31380561cf.3.1784895781535;
        Fri, 24 Jul 2026 05:23:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebad78sm339747966b.46.2026.07.24.05.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 05:23:00 -0700 (PDT)
Message-ID: <720eb684-ae89-4003-b167-e427b4d31add@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: clean-up simple provider misuse of the
 consumer API
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfX1wixdT+68sVm
 6Rw47K/6HoTPkbAoFoPrfFPKK9PUuFuTYFADwpblC1rZUVjWILgzUdC4r+H03oh64c8F+/zWy3p
 VasrlENtggD+Aw2juwx2nAojVkUFpGdLhSi8q88BNjGu8JalOdwJr9vBanvwlLtvcexyLywNVkR
 /8u/tbjG5uGkszPslkYgkXKjx6BKKMt9pQ1KMIItE4c57RGtAnM/ZyzQMbQftTntS6UV+TlJsmn
 faw45oEOVnopY/5oCkLkqfU+QFlUAFm/tYnofhwGfZH6DfORqKfZnStgF5zPOP695jloQE3O1HZ
 DY3MHOl1yCTKi69E2/MlaKHYhwTiCTSzz7+hI7W3Fhi1bS0K8M9oa/LiOISrHC71WBY3hVHUH8T
 NoDlCXF1C6OqPv5g2vZtmzfSrQq2IMYlfaRX0Y1RZ4JsGmcR4GgyBnw8JsJdgY5j4mHIZbJ/p5O
 PkyCWC22QvyZ6nwHeug==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a635926 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=4bE8Fl-H3dgRu3KWX3sA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: 2--bHmdT8A2vnCa6var2lj_nw8y0-jXj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfXxy04BnsT2//m
 froGTCu4SrX1jbRBj3t55HcLXgTR6cYsslRZRmNHB4osje1vgCHTBD/F/ceUqVgJwpu4TZmCfW7
 owP3Jh52qlpS8PK9pht+/HsOLVHW8qk=
X-Proofpoint-GUID: 2--bHmdT8A2vnCa6var2lj_nw8y0-jXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240112

On 7/24/26 11:03 AM, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
> 
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
