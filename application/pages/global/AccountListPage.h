/* Copyright 2013-2015 MultiMC Contributors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <QDialog>
#include <memory>

#include "pages/BasePage.h"

#include "MultiMC.h"

class QTabWidget;
class AccountsWidget;

class AccountListPage : public QWidget, public BasePage
{
	Q_OBJECT
public:
	explicit AccountListPage(QWidget *parent = 0);
	~AccountListPage();

	QString displayName() const override
	{
		return tr("Accounts");
	}
	QIcon icon() const override
	{
		auto icon = MMC->getThemedIcon("accounts");
		if(icon.isNull())
		{
			icon = MMC->getThemedIcon("noaccount");
		}
		return icon;
	}
	QString id() const override
	{
		return "accounts";
	}
	QString helpPage() const override
	{
		return "Getting-Started#adding-an-account";
	}

private:
	QTabWidget *m_tabs;
	AccountsWidget *m_accountsWidget;
};
