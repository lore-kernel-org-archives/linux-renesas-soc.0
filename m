Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820727;
	b=PoU6AXtffZZeHI7rQpsxKbGNAC+WhHPjx4ikrytnh1kaPJZ7zSXnt5gC+VQ2iIx6x+Zr
	 q5ImstMFFX6W3ghD7SXlDlEq0SNwNaqCfZIwkTZ+ZZZbQoEAh5tUZ75iW7ULdtKs2MfQW
	 ENU8X0sjqvzkCTJuc3jTO1SG0xIKaL/ZZ7K0qK6uqz1EJPtcws5PLMTkvNymq7hp12hOj
	 6StzPdVKVOsJlsHGa8MMJI2nVYAnteQgI3L1dq+E3w5w6achcoomwPmlQSRkCB+b8L0Va
	 2suF+JjmMyc1kKcioJij3HZ5MUcHDxso/q4Rg8RHAxzVRiclL71ronCVHOtCYVD3Gmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=10u893rXAEpcFiupZuZpxx17JcoZ4ukJ5pGVXipeKIc=;
	b=QxW8Era6w64wdS0+w/pn7ghykwF5r6n5Ek8y2y2vy1G+dlp6EdS0D0Vc22qaQSyxmgD5
	 WomSH+Nj8LgnhQ6nshLJiY/ZVMMFD0pfXQ4/vQE78Wo1ZQ+od9Am7xwKRQAGe34XkR20Z
	 9iPai13oAmwOrLxvmBMWcxA+GcoBYkmLq49P4pFYatrFHMZ0R+0VhvrhE+GVgd3MWoFWO
	 LW3ReKvoEQeccFIFWDzXipZtofnxGT7qo4aRmx8n9o+Ej9DT3sbQ/Vwj9ofqYuDRrrpP1
	 4cGEZOnfJyNRMrcI/4rts1UTMGgRpeuQ8UTA7jjSCpjlN7LhThLwCt7iRcNExlquOUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0qzup1U/";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A96606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 09:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qzup1U/
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1346831b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794820726; x=1795425526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10u893rXAEpcFiupZuZpxx17JcoZ4ukJ5pGVXipeKIc=;
        b=0qzup1U/bvdpamdUfesp3EzGohjqD6ufcdkxabru/+P1e2lLmEhTqvPFxhiQUJLOuy
         75ZaKlgkGDXWyEh0O7LTEEKNc5q+1cotzhdC0E5B5IjSRuna1VXMOyouKiqLsg6zUVWQ
         kKN19bGG5PO+g4HH7bMNQ3kABDLLxW9cPxDnZYdNKQeJbfcKoyaQ3a/l1F21SD81YImE
         qVhuxwwNl3a38fu49yIa4TcsmyRsn+P0J2KPmZCNL/x1uXeIyzA4yamOwAuAxvioSA5L
         xbF9n061Z+WyXWv0kHGZhiWW8KpSOv0SpLn65dw+0PdYFSQFo7MzfGLaDgXXEMTpFU/+
         H9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820726; x=1795425526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=10u893rXAEpcFiupZuZpxx17JcoZ4ukJ5pGVXipeKIc=;
        b=DvoJ/C8zPsNPAxfqFtrw/LJuCbVfObfON/eWuKe9ycSdKmnUGkSjyvL4wx778gPYv3
         kVFNpV6v+/MNi5mxWj3hakTKvFPEoMly+/odMgdJkStPMBqCdHv06NHRL0vkGP2AseXW
         Q5NNZKKL5zDIXGzZqr8PfibIzTpqKB/jFR1uEQKlRD7G2WfI0Ykqb4BVrUwhOPomnpNK
         4olG6gpsXhZ1HEfzmVQrrNsOSTMKifLzby7cReS3lbYM+BMuJUL5KlFtrE+LwahsUeya
         Fne4iErjUqF3q+o23mKx7CGn26Lfc0zLp1ikRHFKZgthFDiMEENGS0Gb2kO+a3eRoJpX
         7JAg==
X-Forwarded-Encrypted: i=1; AL+hErE6paiINQlKghySbaNmKDI7i+npEMYzDBhc0OJxpG46kVjoWTUkXPNeMZFGIcrmv0XOIsdjxAYq4PCDJqmbL2jleA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8ijE+dI4JG3BUXtM9sHNZf6FMlE7CVdRo2lUauKdN3u4f+jJb
	eyIxyhkl5fyt4MIBGPCihrbuEx9X4/oUTFqUmNmA+W0G/TDMg5jx+ZhJRJmaP2Jp
X-Gm-Gg: AYBFou2OHrGZApwLR6G2KNbO2JchVe1/iv6c9dS1fgu65zevPspdzBTF0I1qclqyYvN
	OvoU4y799H0K27w+LnyfC4Qgo53F/VtLJB70J7G+vxY7beZNpSBmCJuTwrL1K34CpDyBVifK6vC
	1uRw2VfQqdJrqGBcDOyP6R/40u1quiqcuOQgSrA+SSiAsIVgCn8bfJZXsLYb3odQYEefsnT+/1F
	yB7akScJB5umAOXviL2l91GsDYIn5PWcbfqHK6KHeqq45snoBZLcgOnuqIqlXqWznqBfz/qR7UG
	zHLbYQ/ZIxnckK+0KG/HyA10iJitKgrwCNIfizR9uQX6hR8gfyszn04DkJWy7Fnicsb9ZR4fcOB
	lyE+ztgRPaxqx+tHM/RP47JxS/JnqnEWqHz4lSldMKDIlUdOt1WPUhQI/xeCpMKMjfNn+1LNjC/
	oriKpqwk4gkRFc04jzh87mr3OG23liSa9y6U0EdNTnFSkSPmdqFxnQbkUDRQTLxiPNIg9VbjlIa
	kHAit0s42p2w0RyGv9kv9NimRYdk8oVD2EXJ19Zqlryyrg+4ncLiISaDl0XkJgXxLTOwpc2s9L3
	h4YP6Tv007ukEI9vBXm59pk430DTFTZevb1ejKA74r/OpS/CnivSUwnY4ZsOBAM+ry6B3b2egdg
	Eww3tXJywXJGr8g==
X-Received: by 2002:a05:6a00:4087:b0:874:706d:962a with SMTP id d2e1a72fcca58-8beb619e287mr9631280b3a.28.1794820726299;
        Mon, 16 Nov 2026 01:18:46 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8024sm3286470b3a.11.2026.11.16.01.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:18:46 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module autoloading
Date: Mon, 16 Nov 2026 16:17:20 +0700
Message-Id: <20261116091720.112637-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <TYYPR01MB66035439726639C9F4C2A5B9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <TYYPR01MB66035439726639C9F4C2A5B9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Biju,

On Mon, Nov 16, 2026 at 09:00 UTC, Biju Das wrote:
> A patch is already mainlined [1] with these changes as part of RZ/G3L
> regulator support.

Sorry, I missed that series. Please drop this patch.

On Mon, Nov 16, 2026 at 09:06 UTC, Biju Das wrote:
>> +static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] = {
>> +	{ .name = "rzg2l-usb-vbus-regulator" },
>
> Have you tested this patch properly?
>
> I had an issue in probing the device related to id_table match due to
> string length restriction in [2]

You are right. "rzg2l-usb-vbus-regulator" is 24 characters long, so it
does not fit in name[PLATFORM_NAME_SIZE] together with its terminating
NUL.

I tested it on an RZ/G2L SMARC EVK with the driver built as a module:
the module was loaded automatically and USB0 probed. But that only
worked by luck: driver_data is 0 and directly follows name[], so
strcmp() stops there. With a non-zero driver_data, as in your RZ/G3L
patch, the match fails. Renaming the device, as you did, is the right
fix.

Thanks for the review,
Nhat
