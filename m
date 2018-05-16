Return-Path: <devicetree-owner@vger.kernel.org>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] Add R8A77980 GEther support
Message-ID: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
Date: Wed, 16 May 2018 22:52:40 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 3 patches against DaveM's 'net-next.git' repo. They (gradually)
add R8A77980 GEther support to the 'sh_eth' driver, starting with couple new
register bits/values introduced with this chip, and ending with adding a new
'struct sh_eth_cpu_data' instance connected to the new DT "compatible" prop
value...

[1/1] sh_eth: add RGMII support
[2/3] sh_eth: add EDMR.NBST support
[3/3] sh_eth: add R8A77980 support

MBR, Sergei
